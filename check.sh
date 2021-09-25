#!/bin/bash

source <(grep = resources.conf)

echo $check_url:$check_port
echo $send_url:$send_port

server=ya.ru
if nc -zv $check_url $check_port 2>/dev/null; then
    echo "$server ✓"
    netcat $send_url $send_port <<< '{failed + : + " + $check_url + : + $check_port + " +}'
else
    echo "$server ✗"
fi