本地没有修改任何文件，但是

执行git status的时候，显示修改文件如下：

% git status
On branch taiyuan2.1
Your branch is up to date with 'origin/taiyuan2.1'.
 
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)
 
        modified:   flower.jpg
no changes added to commit (use "git add" and/or "git commit -a")
然后再执行git diff flower.jpg

结果内容如下：

diff --git a/flower.jpg b/flower.jpg 
old mode 100644 
new mode 100755
文件内容并没有发生改变

产生这个问题的原因就是：

filemode的变化，文件chmod后其文件某些位是改变了的，如果严格的比较原文件和chmod后的文件，两者是有区别的，但是源代码通常只关心文本内容，因此chmod产生的变化应该忽略，所以设置一下：

切到源码的根目录下，
```
git config --add core.filemode false
```