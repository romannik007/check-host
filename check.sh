#!/bin/bash

source <(grep = resources.conf)

echo $check_url:$check_port
echo $send_url:$send_port

if nc -zv -w 5 $check_url $check_port 2>/dev/null; then
    echo "$check_url ✓"
else
    echo "$check_url ✗"
    nc $send_url $send_port <<< "{\"failed\" : \"$check_url:$check_port\"}"
fi