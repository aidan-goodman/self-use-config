#! /bin/bash

echo "******************"
echo "start es-kill script"

pid=`ps -ef | grep 'elasticsearch' | grep -v '00:00:00' | awk '{print $2}'`

if [ -n "$pid" ]
then
    echo "kill es pid: $pid"
	kill -9 $pid
fi

echo "success"
res=`ps -ef | grep 'elasticsearch' | grep -v 'grep'`
if [ -n "$res" ]
then
	echo "after exec: $res"
fi
echo "******************"
