#!/bin/bash

if [ $PASSWD ] ; then
    echo "root:$PASSWD" | chpasswd
    echo $PASSWD | vncpasswd -f > /root/.vnc/passwd
fi
/usr/sbin/sshd -D & source /root/.bashrc
vncserver -kill :0
rm -rfv /tmp/.X*-lock /tmp/.X11-unix
if [ "$(arch)" = "aarch64" ] ; then
    LD_PRELOAD=/lib/aarch64-linux-gnu/libgcc_s.so.1 vncserver :0 -geometry $SIZE -localhost no
else
    vncserver :0 -geometry $SIZE -localhost no
fi
tail -f /root/.vnc/*:0.log
