
说明
===
主要为了 Android 端集成学习

基于3.3.3版本,拓展集成了h264、aac、lamemp3编码器

ndk版本为android-ndk-r14b，其他版本可能存在问题

使用
===

```
 git clone https://github.com/yhaolpz/FFmpeg

 cd FFmpeg

 git checkout -b cmd_ffmpeg_app_3 origin/cmd_ffmpeg_app_3

 cd compile

 //修改compile.sh文件配置ndk路径（必须）

 //修改do-compile-ffmpeg.sh文件配置编解码选项，默认开启aac,x264,lame编码器

 sudo sh compile.sh

 得到compile/lib/libffmpeg.so
```



