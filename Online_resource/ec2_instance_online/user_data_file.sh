#!/bin/sh

sudo timedatectl set-timezone Europe/Brussels
sudo yum -y install bind-utils

#Setting the parameters
stunnel_version=stunnel-5.57
file_system_id=PROVIDE NAME
file_system_path=/post
file_system_path_first=/
mount_dir=/remote/j2ee/nas
accesspoint_id=PROVIDE NAME
soft_link_path=/mnt/shared_storage/post

#Creating mount directory
sudo mkdir -p ${mount_dir}
sudo mkdir -p ${soft_link_path}

#Start Backup of the post directory
backup_dir=/mnt/tmp
sudo mkdir -p ${backup_dir}
sudo chmod -R 777 ${backup_dir}
cp -r ${soft_link_path} ${backup_dir}/.

################################# Installation starts #################################

#Installing EFS utility
cd ~
sudo yum install -y amazon-efs-utils
sudo yum -y install git
git clone https://github.com/aws/efs-utils
sudo yum -y install make
cd efs-utils/
sudo yum -y install rpm-build
sudo make rpm
sudo yum -y install ./build/amazon-efs-utils*rpm

#Stunnel Upgrade
#https://www.stunnel.org/downloads.html
sudo yum install -y gcc openssl-devel tcp_wrappers-devel
cd ~
wget https://stunnel.org/downloads/${stunnel_version}.tar.gz
sudo tar xvfz ${stunnel_version}.tar.gz
cd ${stunnel_version}
sudo ./configure
sudo make
sudo rm /bin/stunnel
sudo make install

################################# Installation ends #################################

#Mounting the EFS for the first time
sudo mount -t efs -o iam,tls,accesspoint=${accesspoint_id} ${file_system_id}:${file_system_path_first} ${mount_dir}

#Restore the backup
cp -r ${backup_dir}${file_system_path} ${mount_dir}/.

#Unmounting the EFS
sudo umount ${mount_dir}


#Mounting the EFS
sudo mount -t efs -o iam,tls,accesspoint=${accesspoint_id} ${file_system_id}:${file_system_path} ${mount_dir}

#Reboot protection
echo "${file_system_id}:${file_system_path} ${mount_dir} efs _netdev,tls,iam,accesspoint=${accesspoint_id} 0 0" | sudo tee -a /etc/fstab

#verify fstab entry
sudo mount -fav

#Create soft link
sudo rm -rf ${soft_link_path}
sudo ln -s ${mount_dir} ${soft_link_path}

#Cleanup
sudo rm -rf efs-utils Mount.sh ${stunnel_version}*

