给编译好的nginx，添加http_ssl_module模块及配置ssl证书
1.切换到源码包：
```
# cd /root/nginx-1.12.0
```
2.进行编译：
```
# ./configure --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module
```
3.配置完成后，运行命令：
```
# make
```
make命令执行后，不要进行make install，否则会覆盖安装。

4.备份原有已安装好的nginx：
```
# cp /usr/local/nginx/sbin/nginx /usr/local/nginx/sbin/nginx.bak
```
5.停止nginx状态：
```
# /usr/local/nginx/sbin/nginx -s stop
```
6.将编译好的nginx覆盖掉原有的nginx：
```
# cd /root/nginx-1.10.1/

# cp ./objs/nginx /usr/local/nginx/sbin/
```
7.提示是否覆盖，输入yes即可。

8.然后启动nginx：
```
# /usr/local/nginx/sbin/nginx
```
9.进入nginx/sbin目录下，通过命令查看模块是否已经加入成功：
```
# cd /usr/local/nginx/sbin/

# ./nginx -V
```
10.有以下提示，证明已经编译成功：
```
nginx version: nginx/1.12.0
built by gcc 4.8.5 20150623 (Red Hat 4.8.5-39) (GCC)
built with OpenSSL 1.0.2k-fips 26 Jan 2017
TLS SNI support enabled
configure arguments: --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module
```