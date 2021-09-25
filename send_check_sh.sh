#!/bin/bash

host=192.168.88.15 # сервер, куда заливаем файлы
key=~/.ssh/nout # ssh ключ
user=roman # пользователь

scp -i $key ./check.sh $user@$host:~/
scp -i $key ./resources.conf $user@$host:~/
scp -i $key ./set_cron_sh.sh $user@$host:~/
ssh -i $key $user@$host chmod +x ~/check.sh
ssh -i $key $user@$host chmod +x ~/set_cron_sh.sh
ssh -i $key $user@$host ~/set_cron_sh.sh
