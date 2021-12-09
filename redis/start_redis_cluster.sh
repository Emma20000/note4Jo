#!/bin/sh
localip="10.0.3.188"
userdir="/home/ec2-user/redis_im"
find ${userdir}/redis_cluster/ -name "nodes.conf"|xargs sed -i "s#192.168.188.155#${localip}#g"
sleep 1


${userdir}/redis/bin/redis-server ${userdir}/redis_cluster/8001/redis_8001.conf
${userdir}/redis/bin/redis-server ${userdir}/redis_cluster/8002/redis_8002.conf
${userdir}/redis/bin/redis-server ${userdir}/redis_cluster/8003/redis_8003.conf
${userdir}/redis/bin/redis-server ${userdir}/redis_cluster/8004/redis_8004.conf
${userdir}/redis/bin/redis-server ${userdir}/redis_cluster/8005/redis_8005.conf
${userdir}/redis/bin/redis-server ${userdir}/redis_cluster/8006/redis_8006.conf


#${userdir}/redis/bin/redis-trib.rb create --replicas  1  127.0.0.1:8001 127.0.0.1:8002 127.0.0.1:8003 127.0.0.1:8004 127.0.0.1:8005 127.0.0.1:8006    
