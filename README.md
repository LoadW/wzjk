# 多网站监控&脚本执行

一个监控网站，检测异常并执行脚本的bat

脚本不含有任何危险，如果遇到安全软件阻拦，请允许运行

不存在上传记录信息的行为，请放心使用，可自行查看源代码

# 使用方法：

1.打开目录下的wz.list
这里面是填写网站地址的,一行一个，开头不要有空格

2.打开/info/目录，里面新建一个以该网站ip为名称的txt，例如 103.242.135.161.txt

打开这个文件，向里面写入ssh连接内容(信息要填对) <br />
<br />
103.242.135.161 <br />
22 <br />
root <br />
xxxxxx <br />
<br />
一行一个，分别是ip,端口,用户名,密码


# 配置备注

其实还可以配置第5行,第五行是要执行的sh脚本地址

可以填写存放在本地的绝对路径地址，例如D:\sh\xxx.sh

如果只是填写文件名的话，例如xxx.sh，将会读取到主目录下/sh/xxx.sh 这个文件

如果不建立/info/ip.txt这个文件,则不会执行脚本，只会提示网址是否可访问

默认执行/sh/restart.sh脚本，里面是重启命令，请根据服务器情况调整要执行的命令


# 注意事项

因为putty.exe 会在第一次访问ssh时 弹窗提示你确认登录 会阻挡操作

所以程序中会开启一个puttyAlertStopper.exe进程来屏蔽弹窗 请勿杀掉这个进程

putty.exe 为官方英文原版 不是国内的汉化修改版 请放心使用


# 作者留言

发现问题 欢迎反馈 	QQ:1102952084

快捷使用 方便你我 给个Star 感激不尽

 ｡:.ﾟヽ(｡◕‿◕｡)ﾉﾟ.:｡+ﾟ
