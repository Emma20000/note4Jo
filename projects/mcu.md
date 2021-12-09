- >  从dev分支 checkout -b release版本的分支， 放在那就好。    自己部署打成 docker镜像， 去银行一般是 提供jar包运行

- > MCU中channel(频道)为抽象概念， 会议、直播、2人通话等都会使用mcu中的一个channel。

- >如果uccId冲突，需要用peerId标识当前操作的是哪个 主要的是标识相同uccId时，区分用户。 比如uccId相同导致冲突的时候需要踢出前一个用户，此时后一个用户也在加入房间中，踢人通知和用户离开通知下发的时候是需要标识用户的，不然GW区分不开，会把后者数据也清除掉

- > adapter 通话服务

- > target属性 用于区分 具体业务服务【conference adapter live】