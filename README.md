## Elasticsearch Dev Example (Single Node)

####
### Local Testing with Docker

**Build**
```sh
docker build -t klovercloud/elasticsearch:7.12.1 .
```

**Run**
```sh
docker run --rm -it --name elasticsearch --read-only --tmpfs=/tmp -p 9200:9200 -v /vol/elasticsearch:/usr/share/elasticsearch -p 9300:9300 -e "discovery.type=single-node" -e "xpack.security.enabled=true" -e ELASTIC_PASSWORD=keepitsecret --user=1000 whyxn/elasticsearch:7.12.1
```

####
### Run in KloverCloud
- On-board this repository as Application
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
xpack.security.enabled=true
```
- Create a secret for password for default username (elastic)
```
ELASTIC_PASSWORD=keepitsecret
```
- Deploy Elasticsearch