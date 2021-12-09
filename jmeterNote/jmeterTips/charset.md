1.修改配置文件jmeter.properties，搜索sampleresult.default.encoding，可以找到默认编码格式为ISO-8859-1，手动修改为UTF-8
```
The encoding to be used if none is provided (default ISO-8859-1)
sampleresult.default.encoding=UTF-8
```

2.增加元器件

在线程组右键，添加->后置处理器->BeanShell PostProcessor

增加后，在Script栏中填写如下代码：

prev.setDataEncoding(“UTF-8”);

这两种方式都可以解决中文乱码问题。