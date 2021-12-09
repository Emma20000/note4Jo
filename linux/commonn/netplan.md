---
title: ubuntu-netplan详解
date: '2021-04-21 16:15:00'
categories:
 - ubuntu
tags:
 - ubuntu
---

# linux-netplan文件详解

## 编辑文件
```
sudo vim /etc/netplan/00-installer-config.yaml
```
### 文件详情
```
network:
  ethernets:
    enp3s0:   ## 操作的网卡
      dhcp4: no  ##是否自动获取ip
      dhcp6: no
      addresses:
       - 172.16.106.65/24 ##ip地址
      gateway4: 172.16.106.1 ##网关
      nameservers:
       addresses: [8.8.8.8, 114.114.114.114] ##dns
      routes: ##路由
        - to: 192.168.200.0/24
          via: 172.16.106.1
  version: 2
```

### 虚拟网桥

```
network:
   version: 2
   ethernets:
      enp1s0: #enp1s0代码网卡名称,把该名称进行替换为自己的网卡名称
        dhcp4: yes #动态分配
        dhcp6: no
   bridges:
        kvmBr: #自定义虚拟网卡名称
            interfaces: [enp1s0]  # 根据enp1s0网卡虚拟桥
            dhcp4: yes #动态分配
            dhcp6: no
            nameservers:
              addresses: [8.8.8.8, 114.114.114.114]   # dns             
```

### 更新配置

```
sudo netplan apply
```


### 01-network-manager-all.yaml
```
# Let NetworkManager manage all devices on this system
network:
  version: 2
  renderer: networkd
  ethernets:
      enp3s0: #enp1s0代码网卡名称,把该名称进行替换为自己的网卡名称
        dhcp4: yes #动态分配
        dhcp6: no
#      wlp2s0:
#        dhcp4: yes
#        dhcp6: no       
#  bridges:
#        kvmBr: #自定义虚拟网卡名称
#            interfaces: [enp3s0]  # 根据enx2c16dba14e2c网卡虚拟桥
#            dhcp4: yes #动态分配
#            dhcp6: no
#            addresses: 
#             - 192.168.2.21/24
#            gateway4: 192.168.2.1
#            nameservers:
#             addresses: [8.8.8.8, 114.114.114.114]   # dns


#network:
#  version: 2
#  ethernets:
#      enp3s0: #enp1s0代码网卡名称,把该名称进行替换为自己的网卡名称
#        dhcp4: no #动态分配
#        dhcp6: no
#  bridges:
#        kvmBr: #自定义虚拟网卡名称
#            interfaces: [enp3s0]  # 根据enx2c16dba14e2c网卡虚拟桥
#            dhcp4: yes #动态分配
#            dhcp6: no
#            nameservers:
#              addresses: [8.8.8.8, 114.114.114.114]   # dns




```