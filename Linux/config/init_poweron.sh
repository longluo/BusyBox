#!/bin/sh

# init_poweron.sh 需要放到目录 /etc/profile.d/ 下，系统启动后就会自动执行该目录下的所有shell脚本。

# WSL 
# 重新挂载磁盘
# 如果 AOSP 源码放在了Windows驱动器上，比如说 E:\aosp ，在WSL中的路径应该是 /mnt/e/aosp 
# 这种形式的，此时需要以drvfs文件系统重新挂载盘符，否则编译到中途会报错

sudo umount /mnt/e/
sudo mount -t drvfs E: /mnt/e/ -o metadata


exit 0


