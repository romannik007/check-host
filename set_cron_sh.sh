#!/bin/bash
#удалить существующее задание
crontab -l | grep -v '~/check.sh'  | crontab -
#добавить задание
cat <(crontab -l) <(echo "* * * * * ~/check.sh") | crontab -