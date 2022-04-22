#### 一、安装docker
- 安装docker sudo apt-get install -y docker.io
- 启动docker服务 systemctl start docker
- 设置开机启动 systemctl enable docker
- 查看docker状态 systemctl status docker
- 停止docker服务 systemctl stop docker
- 查看docker版本 docker version

#### 二、非root用户运行docker
- 添加docker用户组 sudo groupadd docker  执行以上命令会提示已存在， 原因是在安装docker时已自动创建
- 将指定用户添加到用户组（username为你的用户名）： sudo gpasswd -a username docker
- 查看是否添加成功： cat /etc/group | grep ^docker
- 重启docker： sudo systemctl restart docker
- 更新用户组： newgrp docker
- 执行docker命令 比如 docker ps