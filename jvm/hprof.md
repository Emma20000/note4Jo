1.输出方式有两种方式：    

　　a、在start.sh启动参数配置outofmemory时触发打印堆快照　

      export JAVA_OPTS=-XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/export/Domains/rcsv-fm.wd.local/server1/logs
      
　　b.jvm 命令参数jmap -dump:format=b,file=xxx.hprof  pid以上是拿.hprof文件的方式。

 
温馨提示：kill -3 or -9 都不会打heap dump，kill jvm来不及做任何事情就被干掉了，-3会打印thread dump 但是不是heap dump