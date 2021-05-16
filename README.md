## Elasticsearch Dev Example (Single Node)

####
### Local Testing with Docker

**Build**
```sh
docker build -t klovercloud/elasticsearch:7.12.1 . -f Dockerfile-base-image
```

**Run**
```sh
docker run --rm -it --name elasticsearch --read-only --tmpfs=/tmp -p 9200:9200 -p 9300:9300 -v /vol/elasticsearch:/usr/share/elasticsearch -e "discovery.type=single-node" -e "xpack.security.enabled=true" -e ELASTIC_PASSWORD=keepitsecret --user=1000 klovercloud/elasticsearch:7.12.1
```

**Test Connection**
```
curl -i -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Basic <YOUR_BASIC_AUTH_TOKEN>" http://localhost:9200
```
YOUR_BASIC_AUTH_TOKEN=base64(username:password)
default username: elastic

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
xpack.security.enabled=true
```
- Create a secret for password for default username (elastic)
```
ELASTIC_PASSWORD=keepitsecret
```
- Deploy Elasticsearch