- > 不要写成 log.debug ( "Load No." + i + " object, " + object ); 这是因为将日志级别调至 INFO 或以上级别时，这样会增加无畏的字符串拼接。
- > 需要输出日志的对象，应在其类中实现快速的 toString 方法，以便于在日志输出时仅输出这个对象类名和 hashCode。该 toString 方法应该处理类中所有的字段。toString 方法可以通过 IDE 的自动功能 toString 功能生成。toString 方法建议不要通过反射或者一些 toString 工具类生成，也不要直接使用 JSON 序列化工具转为 JSON 字符串，这两者均使用反射进行处理的，仅为了输出日志较为影响应用的性能。
- > 对于一些一定需要进行拼接字符串，或者需要耗费时间、浪费内存才能产生的日志内容作为日志输出时，应使用 log.isXxxxxEnable() 进行判断后再进行拼接处理，比如：
```
        if (logger.isDebugEnable()) {
            StringBuilder builder = new StringBuilder();
            for (Student student : students) {
                builder.append("student: ").append(student);
            }
            builder.append("value: ").append(JSON.toJSONString(object));
            logger.debug("debug logger example, detail: {}", builder);
        }
```