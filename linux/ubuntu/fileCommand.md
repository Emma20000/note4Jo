### find根据文件大小查找文件

```
-size [+|-]#UNIT

常用单位：k, M, G，c（byte）,注意大小写敏感

#UNIT: (#-1, #] 如：6k 表示(5k,6k]

-#UNIT：[0,#-1] 如：-6k 表示[0,5k]

+#UNIT：(#,∞) 如：+6k 表示(6k,∞)

find /  -size +10M