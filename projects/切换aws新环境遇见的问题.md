### 1 部署时 与 nacos服务无法交互 报错
查看 安全组策略

### 2 登录时如果不通过nginx ssl 第一步没问题 第二部会出现问题

### 3 预登陆丸子后有问题
修改 nacos ZoneConfig.properties 里面 http 和 mqtt相关ip地址

### 4 登录成功后 无法加入 自研channel
查看android日志得知  下发的mediaAddress地址有问题。 查看 nacos 上面 mediaGW 服务绑定的地址 

### 5 切换磁盘 重新挂载 后 启动 docker 服务 报错如下
```
2021-12-08 20:30:19.652 [reactor-http-nio-1] ERROR reactor.netty.tcp.TcpServer - [id: 0xf8bb35cd, L:/10.0.0.156:8053 ! R:/10.0.0.59:47578] onUncaughtException(SimpleConnection{channel=[id: 0xf8bb35cd, L:/10.0.0.156:8053 ! R:/10.0.0.59:47578]})
io.netty.util.IllegalReferenceCountException: refCnt: 0, decrement: 1
        at io.netty.util.internal.ReferenceCountUpdater.toLiveRealRefCnt(ReferenceCountUpdater.java:74)
        at io.netty.util.internal.ReferenceCountUpdater.release(ReferenceCountUpdater.java:138)
        at io.netty.buffer.AbstractReferenceCountedByteBuf.release(AbstractReferenceCountedByteBuf.java:100)
        at io.netty.handler.codec.ByteToMessageDecoder.channelInputClosed(ByteToMessageDecoder.java:367)
        at io.netty.handler.codec.ByteToMessageDecoder.channelInactive(ByteToMessageDecoder.java:342)
        at io.netty.channel.CombinedChannelDuplexHandler.channelInactive(CombinedChannelDuplexHandler.java:223)
        at io.netty.channel.AbstractChannelHandlerContext.invokeChannelInactive(AbstractChannelHandlerContext.java:245)
        at io.netty.channel.AbstractChannelHandlerContext.invokeChannelInactive(AbstractChannelHandlerContext.java:231)
        at io.netty.channel.AbstractChannelHandlerContext.fireChannelInactive(AbstractChannelHandlerContext.java:224)
        at io.netty.channel.DefaultChannelPipeline$HeadContext.channelInactive(DefaultChannelPipeline.java:1429)
        at io.netty.channel.AbstractChannelHandlerContext.invokeChannelInactive(AbstractChannelHandlerContext.java:245)
        at io.netty.channel.AbstractChannelHandlerContext.invokeChannelInactive(AbstractChannelHandlerContext.java:231)
        at io.netty.channel.DefaultChannelPipeline.fireChannelInactive(DefaultChannelPipeline.java:947)
        at io.netty.channel.AbstractChannel$AbstractUnsafe$8.run(AbstractChannel.java:822)
        at io.netty.util.concurrent.AbstractEventExecutor.safeExecute(AbstractEventExecutor.java:163)
        at io.netty.util.concurrent.SingleThreadEventExecutor.runAllTasks(SingleThreadEventExecutor.java:404)
        at io.netty.channel.nio.NioEventLoop.run(NioEventLoop.java:464)
        at io.netty.util.concurrent.SingleThreadEventExecutor$5.run(SingleThreadEventExecutor.java:884)
        at io.netty.util.concurrent.FastThreadLocalRunnable.run(FastThreadLocalRunnable.java:30)
        at java.lang.Thread.run(Thread.java:745)
```

重新打docker 镜像  重新运行  解决问题。 但是不知道是为什么。