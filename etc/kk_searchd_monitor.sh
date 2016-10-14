#!/bin/sh
pids=`ps aux|grep kk_search.conf |grep -v grep | awk '{print $2}'  `
if [ ! "$pids" ];then
    echo " searchd crashed, starting .."
else
  echo "search is runing ,normal"	
  exit;	
fi
