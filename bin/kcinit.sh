#!/bin/bash
set -e

fileCount=$(find /tmp-elasticsearch -type f | wc -l)
echo $fileCount

if [ -d "/usr/share/elasticsearch" ]
then
	echo '[INFO] Persistant volume mounted'
	fileCount=$(find /usr/share/elasticsearch -type f | wc -l)
	if [ $fileCount -gt 100 ]
         then
         echo "elasticsearch files exists"
	else
		echo "[INFO] Copying elasticsearch files to /usr/share/elasticsearch";
		cp -a /tmp-elasticsearch/. /usr/share/elasticsearch/.
		echo "[INFO] Finished copying Elasticsearch files to /usr/share/elasticsearch";
	fi
	fileCount=$(find /usr/share/elasticsearch -type f | wc -l)
	echo $fileCount
else
	echo '[ERROR] /usr/share/elasticsearch doesnt exists'
fi