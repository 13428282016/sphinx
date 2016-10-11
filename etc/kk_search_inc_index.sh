#!/bin/sh
#kk_search_main_index 
index_lock_file='/usr/local/coreseek/var/tmp/kk_search_main_inc.lock'

if [ -d $index_lock_file ];then
	echo "is indexing...exit"
	exit;
else	
	echo "created lock file {$index_lock_file}"
	eval mkdir -p $index_lock_file
fi	

echo  "start indexing"
echo "inc indexing"  
  /usr/local/coreseek/bin/indexer kk_search_inc kk_search_update -c  /usr/local/coreseek/etc/kk_search.conf --rotate   
echo "mergeing index"
/usr/local/coreseek/bin/indexer --merge kk_search kk_search_inc  -c  /usr/local/coreseek/etc/kk_search.conf --rotate --merge-killlists 
  /usr/local/coreseek/bin/indexer --merge kk_search kk_search_update  -c  /usr/local/coreseek/etc/kk_search.conf --rotate --merge-killlists
 
echo  "finished indexxing"

eval rm -r  $index_lock_file
echo "remove lock file";
