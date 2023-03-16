## command
## update
- `GITLAB_HOME=/mnt/storage1/gitlab/ docker compose pull`
- `GITLAB_HOME=/mnt/storage1/gitlab/ docker compose up -d`

## backup
```crontab
# gitlab_backup.shを/usr/local/bin以下に配置し、cronで定期実行
30 2 * * 1-5 /bin/bash /usr/local/bin/gitlab_backup.sh > /var/log/gitlab_bk.log 2>&1
```
