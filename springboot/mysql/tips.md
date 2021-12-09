- > 从数据库中取出数据后 日期字段 时间和数据库相差8小时。作如下修改：
```
3306/db?useUnicode=true&characterEncoding=utf-8&**serverTimezone=Asia/Shanghai**

spring:
  jackson:
    date-format: yyyy-MM-dd HH:mm:ss
    time-zone: GMT+8
``` 

