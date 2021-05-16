#!/bin/bash
set -e

if [ -d "/usr/share/elasticsearch" ]
then
	echo '[INFO] Persistant volume mounted'
	fileCount=$(find /usr/share/elasticsearch -type f | wc -l)
	if [ $fileCount -gt 100 ]
         then
         echo "elasticsearch files exists"
	else
		echo "[INFO] Copying elasticsearch files to /usr/share/elasticsearch";
		cp -ar /tmp-elasticsearch/. /usr/share/elasticsearch/.
		echo "[INFO] Finished copying Elasticsearch files to /usr/share/elasticsearch";
        fileCount=$(find /usr/share/elasticsearch -type f | wc -l)
	fi
else
	echo '[ERROR] /usr/share/elasticsearch doesnt exists'
fi