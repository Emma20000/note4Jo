### 1 jmeter ws 调试 压测脚本时 抓包查看请求 莫名奇妙的会多出一条 客户端发给服务的请求
- 因为 使用了 WebSocket Single Write Sampler/Websocket request-response Sampler 连接后 会发送请求.  
- 解决办法 使用Websocket Open Connection sampler 连接服务.