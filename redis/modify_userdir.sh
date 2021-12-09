#!/bin/sh
userdir='/home/ec2-user/redis_im'
sed -i "s#/home/redis#${userdir}#g"  ${userdir}/.bash_profile
find ${userdir}/redis_cluster/ -name "redis_*.conf" |xargs sed -i "s#/home/redis#${userdir}#g"
