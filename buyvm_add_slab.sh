#!/bin/bash

# 获取目标设备的ID
disk_id=$(ls /dev/disk/by-id/ | grep "scsi-0BUYVM_SLAB_VOLUME-" | cut -d "-" -f 3)

# 根据ID创建ext4文件系统
mkfs.ext4 -F /dev/disk/by-id/scsi-0BUYVM_SLAB_VOLUME-$disk_id

read -p "请输入挂载目录的路径（例如：/root/Downloads）: " mount_path

# 创建目录并挂载设备
mkdir -p $mount_path
mount -o discard,defaults /dev/disk/by-id/scsi-0BUYVM_SLAB_VOLUME-$disk_id $mount_path

# 设置权限
chmod -R 777 $mount_path

# 将挂载信息添加到fstab文件
echo "/dev/disk/by-id/scsi-0BUYVM_SLAB_VOLUME-$disk_id $mount_path ext4 defaults 0 0" >> /etc/fstab