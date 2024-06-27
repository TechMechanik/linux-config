#!/bin/bash

# Create data share directories, if not exist
sudo mkdir -p /srv/nfs/data/$USER
sudo mkdir -p /home/$USER/Unraid/data

# Create backup share directories, if not exist
sudo mkdir -p /srv/nfs/backup/$USER
sudo mkdir -p /home/$USER/Unraid/backup

# Mount Unraid NFS
sudo mount -t nfs darktower.local:/mnt/user/backups /srv/nfs/backup/eric
sudo mount -t nfs darktower.local:/mnt/user/data /srv/nfs/data/eric

# Create symlinks to home directory
ln -s /srv/nfs/backup/$USER /home/$USER/Unraid/backup
ln -s /srv/nfs/data/$USER /home/$USER/Unraid/data

