- 安装命令
  ```
  sudo apt update
  sudo apt install qemu qemu-kvm bridge-utils  virt-manager
  ```
- 启动报错如图

  ![image_17](../../../img/image_17.png)

- 解决方案
  sudo apt-get install spice-client-gtk python-spice-client-gtk gir1.2-spice-client-gtk-3.0

  ![image_16](../../../img/image_16.png)
- 缺乏安装包，需要增加新的源

  ![image_18](../../../img/image_18.png)

- 新源整理如下：
  ```
  # 默认注释了源码仓库，如有需要可自行取消注释
  deb https://mirrors.ustc.edu.cn/ubuntu/ xenial main restricted universe multiverse
  # deb-src https://mirrors.ustc.edu.cn/ubuntu/ xenial main restricted universe multiverse
  deb https://mirrors.ustc.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse
  # deb-src https://mirrors.ustc.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse
  deb https://mirrors.ustc.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse
  # deb-src https://mirrors.ustc.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse
  deb https://mirrors.ustc.edu.cn/ubuntu/ xenial-security main restricted universe multiverse
  # deb-src https://mirrors.ustc.edu.cn/ubuntu/ xenial-security main restricted universe multiverse
  # 预发布软件源，不建议启用
  # deb https://mirrors.ustc.edu.cn/ubuntu/ xenial-proposed main restricted universe multiverse
  # deb-src https://mirrors.ustc.edu.cn/ubuntu/ xenial-proposed main restricted universe multiverse
  ```
- 不小心删除了libvirt-qemu 用户导致打不开kvm,解决办法
  ```
  sudo useradd -g libvirt-qemu libvirt-qemu
  ```
- 解决：Requested operation is not valid: network 'default' is not active
  ```
  sudo virsh pool-start default
  sudo virsh net-define /etc/libvirt/qemu/networks/default.xml
  virsh net-list --all
   Name                 State      Autostart     Persistent
  ----------------------------------------------------------
   default              inactive   yes           yes
  sudo virsh pool-start default
  报错如下：
  error: Failed to start pool default
  error: cannot open directory '/var/lib/libvirt/images': 没有那个文件或目录
  解决方案：
  sudo mkdir /var/lib/libvirt/images
  然后再次执行：
  sudo virsh pool-start default
  ```
- 解决：error: internal error: Failed to initialize a valid firewall backend
  ```
   sudo sudo systemctl restart libvirtd
  ```
- 解决kvm 桥接后不能与宿主机网络互通
```
network:
   version: 2
   ethernets:
      enp1s0: #enp1s0代码网卡名称,把该名称进行替换为自己的网卡名称
        dhcp4: yes #动态分配
        dhcp6: no
   bridges:
        kvmBr: #自定义虚拟网卡名称
            interfaces: [enp1s0]  # 根据enx2c16dba14e2c网卡虚拟桥
            dhcp4: yes #动态分配
            dhcp6: no
            nameservers:
              addresses: [8.8.8.8, 114.114.114.114]   # dns             
```
