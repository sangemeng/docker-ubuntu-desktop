# 简介

在`ubuntu:20.04`的基础上，安装中文桌面环境，支持SSH和VNC远程连接
<br>

[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/gotoeasy/ubuntu-desktop)](https://hub.docker.com/r/gotoeasy/ubuntu-desktop)
[![Image Layers](https://img.shields.io/microbadger/layers/gotoeasy/ubuntu-desktop)](https://hub.docker.com/r/gotoeasy/ubuntu-desktop)
[![Image Size](https://img.shields.io/microbadger/image-size/gotoeasy/ubuntu-desktop)](https://hub.docker.com/r/gotoeasy/ubuntu-desktop)
[![Docker Pulls](https://img.shields.io/docker/pulls/gotoeasy/ubuntu-desktop)](https://hub.docker.com/r/gotoeasy/ubuntu-desktop)

<br>

# 已知问题
## 连接时间长会黑屏，鼠标变成方块

# 报错
## 链接库问题(ARM设备)
```
Sat May 9 05:34:15 2020
Connections: accepted: 192.168.3.3::2303
SConnection: Client needs protocol version 3.8
SConnection: Client requests security type VncAuth(2)
terminate called after throwing an instance of 'rdr::Exception'
terminate called recursively
(EE)
(EE) Backtrace:
(EE) 0: /usr/bin/Xtigervnc (OsLookupColor+0x188) [0xaaaac24fe038]
(EE) unw_get_proc_info failed: no unwind info found [-10]
(EE)
(EE)
Fatal server error:
(EE) Caught signal 6 (Aborted). Server aborting
(EE)
X connection to :1 broken (explicit kill or server shutdown).^M
Killing Xtigervnc process ID 26960… which was already dead
Cleaning stale pidfile '/home/ubuntu/.vnc/ubuntu:1.pid'!
//启动前带上libgcc_s
# 64位系统
LD_PRELOAD=/lib/aarch64-linux-gnu/libgcc_s.so.1 vncserver -localhost no
# 32位系统
LD_PRELOAD=/lib/arm-linux-gnueabihf/libgcc_s.so.1 vncserver -localhost no
```
参考：[树莓派 Ubuntu 安装vncserver](https://www.cyh.ac.cn/2020/05/09/%E6%A0%91%E8%8E%93%E6%B4%BE-ubuntu-%E5%AE%89%E8%A3%85vncserver/)

# 例子
```
// 以后台方式运行容器，指定SSH和VNC端口，默认密码为123456
docker run -d -p 22:22 -p 5900:5900 gotoeasy/ubuntu-desktop

// 可以指定密码(必须6位以上)及分辨率
docker run -d -p 22:22 -p 5900:5900 -e PASSWD=abcd1234 -e SIZE=1024x768 gotoeasy/ubuntu-desktop

// 用docker-compose方式启动，参考配置docker-compose.yml
docker-compose up
```

# 内容

- [x] `ubuntu:20.04`
- [x] 用户：`root`
- [x] 默认SSH密码：`123456`
- [x] 默认VNC密码：`123456`
- [x] 预装XRDP，但window的远程桌面连接性能较差所以未启动，需要时自行开启`service xrdp start`，默认端口`3389`
- [x] 预装`wget`、`curl`、`firefox`等少许常用软件
- [x] 时区`Asia/Shanghai`
- [x] 中文桌面环境`xfce`
- [x] 中文输入法
- [x] VNC远程桌面连接时支持和本机之间相互复制粘贴文本

# 截图
![https://gotoeasy.github.io/screenshots/docker-ubuntu-desktop/ssh.jpg](https://gotoeasy.github.io/screenshots/docker-ubuntu-desktop/ssh.jpg)
![https://gotoeasy.github.io/screenshots/docker-ubuntu-desktop/vnc.jpg](https://gotoeasy.github.io/screenshots/docker-ubuntu-desktop/vnc.jpg)
