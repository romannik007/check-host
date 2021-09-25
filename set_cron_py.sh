#!/bin/bash
#удалить существующее задание
crontab -l | grep -v 'python ~/check.py'  | crontab -
#добавить задание
cat <(crontab -l) <(echo "* * * * * python ~/check.py") | crontab -