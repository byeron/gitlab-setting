#!/bin/bash

# backup application data and config
docker exec -t gitlab-web-1 gitlab-backup
docker exec -t gitlab-web-1 /bin/sh -c 'gitlab-ctl backup-etc'

APP_SRC=/mnt/storage1/gitlab/data/backups/
CONFIG_SRC=/mnt/storage1/gitlab/config/config_backup/
APP_DST=/mnt/storage2/backup/gitlab/application/
CONFIG_DST=/mnt/storage2/backup/gitlab/secrets/

# delete old backup
cd $APP_SRC && rm $(ls -1t | xargs readlink -f | tail -n+2)
cd $CONFIG_SRC && rm $(ls -1t | xargs readlink -f | tail -n+2)

rsync -av --delete $APP_SRC $APP_DST
rsync -av --delete $CONFIG_SRC $CONFIG_DST
