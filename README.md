## Elasticsearch Dev Example (Single Node)

####
### Local Testing with Docker

**Build**
```sh
docker build -t klovercloud/elasticsearch:7.12.1 . -f Dockerfile-base-image
```

**Run**
```sh
docker run --rm -it --name elasticsearch --read-only --tmpfs=/tmp -p 9200:9200 -p 9300:9300 -v /vol/elasticsearch:/usr/share/elasticsearch -e "discovery.type=single-node" --user=1000 klovercloud/elasticsearch:7.12.1
```

**Test Connection**
```
curl http://localhost:9200
```

####
### Run in KloverCloud
- On-board this repository as Application
- Ports: 9200, 9300
- Assign minimum 1.5vCPU and 3GB RAM
- Persistent Volume is required (Min 5 GB)
- The following paths should be in the Volume Mount paths
```
/usr/share/elasticsearch
```
- Create Application
- Set the following Environment Variables
```
discovery.type=single-node
```
- Deploy Elasticsearch