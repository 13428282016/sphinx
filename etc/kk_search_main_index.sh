#!/bin/sh
#kk_search_main_index 
index_lock_file='/usr/local/coreseek/var/tmp/kk_search_main_index.lock'
if [ -d $index_lock_file ];then
	echo "is indexing...exit"
	exit;
else	
	echo "created lock file {$index_lock_file}"
	eval mkdir -p $index_lock_file
fi	
echo  "start indexing"
 /usr/local/coreseek/bin/indexer  kk_search -c   /usr/local/coreseek/etc/kk_search.conf  --rotate
echo  "finished indexxing"

eval rm -r  $index_lock_file
echo "remove lock file";
