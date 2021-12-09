- > isAssignableFrom(Class<?> cls) 方法是从类的继承角度去看的， 该方法判断是否为参数类的父类。 使用方法 父类.class.isAssinableFrom(子类.class) 
 - 下面这个例子即反射配置注解为对象字段设置默认值（包括父类），仅支持String和本类型的包装部分包装类（Number的子类）。

```
@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Inherited
@Documented
public @interface ParamDefaultValue {
    String value();
}

```

```
public class ParamProcessor {
    public static void applyDefaultValue(Object o) {
        Class sourceClass = o.getClass();
        //获取对象所有字段 包括父类
        ArrayList<Field> fields = new ArrayList<>();
        while (sourceClass != null){
            fields.addAll(Arrays.asList(sourceClass.getDeclaredFields()));
            sourceClass = sourceClass.getSuperclass();
        }

        for (Field field : fields) {
            field.setAccessible(true);
            if (field.isAnnotationPresent(ParamDefaultValue.class)) {
                try {
                    Object val = field.get(o);
                    if (val != null) {
                        continue;
                    }
                    Class type = field.getType();
                    if (type.isPrimitive()) {
                        continue;
                    }
                    String defVal = field.getAnnotation(ParamDefaultValue.class).value();

                    if (String.class.isAssignableFrom(type)) {
                        field.set(o, defVal);
                    } else if (Number.class.isAssignableFrom(type)) {
                        if (Byte.class.isAssignableFrom(type)) {
                            field.set(o, Byte.valueOf(defVal));
                        } else if (Float.class.isAssignableFrom(type)) {
                            field.set(o, Float.valueOf(defVal));
                        } else if (Short.class.isAssignableFrom(type)) {
                            field.set(o, Short.valueOf(defVal));
                        } else if (Integer.class.isAssignableFrom(type)) {
                            field.set(o, Integer.valueOf(defVal));
                        } else if (Double.class.isAssignableFrom(type)) {
                            field.set(o, Double.valueOf(defVal));
                        } else if (Long.class.isAssignableFrom(type)) {
                            field.set(o, Long.valueOf(defVal));
                        }
                    }

                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

```