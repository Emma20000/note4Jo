- 使用分支为 restructure的分支 进行开发， 因为restructure分支为最新分支， 之后将所有新代码合并到 master【作为生产分支使用】
  ---

- 会议里面的用户分三个角色  观众、与会者（参会者）、主持人。  主持人邀请观众上台指的是： 将观众【此时观众只能看到与会者和主持人，与会者和主持人看不到观众】变成与会者，此时不仅conference里面有此用户，平台mcu里面也会有该用户。  平台踢人 到会议那边分两种， 一种是 将参会者踢出， 一种是将观众踢出， 其中参会者还会有直接被踢出操作或者下麦操作【参会者到观众】。
  ---
- android请求创建会议 ->  nginx地址【52.83.224.21：443】 -> gateway -> conference
  ---

- appkey表示多租户， 比如农行、工行等， channelName不唯一，可以重复。 但是 appkey+channelName唯一
