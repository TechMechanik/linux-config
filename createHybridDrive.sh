#!/bin/bash

# Wipe drives
sudo wipefs --all --backup /dev/sda
sudo wipefs --all --backup /dev/sdb

# create 
sudo pvcreate /dev/sda
sudo pvcreate /dev/sdb
# sudo nano /etc/lvm/lvm.conf
sudo vgcreate vg_data /dev/sda /dev/sdb
sudo lvcreate -L 10G -n lv_data vg_data /dev/sda
sudo lvcreate -n cachepool_meta -L 100M vg_data /dev/sdb
sudo lvcreate -n cachepool -L 5G vg_data /dev/sdb
sudo lvconvert --type cache-pool --poolmetadata cachepool_meta vg_data/cachepool
sudo lvconvert --type cache --cache-pool cachepool --cachemode writethrough vg_data/lv_data

# To remove the cache
# lvconvert --uncache vg_data/lv_data

sudo lvextend -l +100%FREE /dev/vg_data/lv_data
