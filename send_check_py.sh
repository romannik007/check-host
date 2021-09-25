#!/bin/bash

host=192.168.88.15
key=~/.ssh/nout
user=roman

scp -i $key ./check.py $user@$host:~/
scp -i $key ./resources.conf $user@$host:~/
scp -i $key ./set_cron_py.sh $user@$host:~/
ssh -i $key $user@$host chmod +x ~/set_cron_py.sh
ssh -i $key $user@$host ~/set_cron_py.sh
