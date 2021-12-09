- > ctrl+u 删除命令行开始至光标处
- > ctrl+k 删除光标处至命令行结尾
- > lsb_release -a  查看系统信息
- > du -h --max-depth=1 查看第一层 下面磁盘大小
- > 时区调整
```
# date -R
# timedatectl set-timezone Asia/Shanghai
# yum -y install ntp
# ntpdate ntp1.aliyun.com
```