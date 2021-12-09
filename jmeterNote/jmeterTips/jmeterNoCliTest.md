#### 1、中途停止压力测试， 在 jmeter bin目录 执行stopTest.sh
#### 2、beanshell中创建参数和其他地方引用参数
beanshell中创建参数
beanshell中创建新的参数newvarname，赋值为另外一个字符串
vars.put(“newvarname”,String.valueOf(definedvarname));

引用参数值，任何一个地方均可以
${newvarname}

#### 3、beanshell里面忘了写 try catch 也会报错。 而且报的错，不会说明是try catch只是 Typed varible declaration