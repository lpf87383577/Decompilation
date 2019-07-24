
## 打包过程
1、通过aapt打包res资源文件，生成R.java、resources.arsc和res文件（二进制 & 非二进制如res/raw和pic保持原样）

2、处理.aidl文件，生成对应的Java接口文件

3、通过Java Compiler编译R.java、Java接口文件、Java源文件，生成.class文件

4、通过dex命令，将.class文件和第三方库中的.class文件处理生成classes.dex

5、通过apkbuilder工具，将aapt生成的resources.arsc和res文件、assets文件和classes.dex一起打包生成apk

6、通过Jarsigner工具，对上面的apk进行debug或release签名

7、通过zipalign工具，将签名后的apk进行对齐处理。

## 反编译

#### 工具
==apktool==

作用：资源文件获取，可以提取出图片文件和布局文件进行使用查看

==dex2jar==

作用：将apk反编译成java源码（classes.dex转化成jar文件）

==jd-gui==

作用：查看APK中classes.dex转化成出的jar文件，即源码文件

#### 获取jar

1、通过命令apktool命令，将APK反编译
```python
apktool d -f app.apk -o app
```

2、将xxx.apk改名成xxx.apk.zip，用压缩工具解压文件，得到classes.dex文件

3、运行d2j-dex2jar classes.dex,得到classes-dex2jar.jar

4、将jar放到studio某个项目中，查看代码

5、找到需要修改的代码，记住代码位置，在反编译文件中找到对应的smali文件进行修改，如果不会smali文件修改，可以在studio中用Java修改，使用java2smali插件转换成smali文件

6、使用apktool重新打包
```python
apktool b test
```

7、APK重新签名

将APk和签名放在同一个文件夹中
```python
jarsigner -verbose -keystore debug.jks -storepass XXXXXX -signedjar android_sign.apk -digestalg SHA1 -sigalg MD5withRSA android.apk key
```
XXXXXX 表示Keystore密码

-signedjar android_sign.apk表示签名后生成的APK名称

android.apk表示未签名的APK 

key:需要换成你的签名文件的别名
