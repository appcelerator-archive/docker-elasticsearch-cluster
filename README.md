# Elasticsearch

[Elasticsearch](https://www.elastic.co/products/elasticsearch) Docker image based on Alpine Linux.

## This repo has moved

This repo is outdated, content has been moved to the [main AMP repo](https://github.com/appcelerator/amp) in the images folder.

### Tags

- `5.1.2`, `latest`

### Exposed ports

- `9200`, `9300`


### Env. variables

Variable | Description | Default value | Example
 ------- | ----------- | ------------- | -------
JAVA_HEAP_SIZE | Java heap size in MB | | 1024
java_max_direct_mem_size | Java max direct memory size | |
java_opts | Java options | |
FORCE_HOSTNAME | IP on which ES will be listening | 0.0.0.0 | 127.0.0.1

When JAVA_HEAP_SIZE is empty, the value is set depending on system max memory (256 to 10% of max memory).

### System prerequisites

Elastic highly recommends to set the VM mmap count to 262144 on the host: https://www.elastic.co/guide/en/elasticsearch/reference/5.0/vm-max-map-count.html

    sudo sysctl -w vm.max_map_count=262144

The hard limit for file descriptors should be at least 65535. You can check it with `ulimit -Hn`.

### docker service creation

```
docker service create --network aNetwork --name elasticsearch \
--replicas 3 \
--label io.amp.role="infrastructure" \
-p 9200:9200 \
-p 9300:9300 \
appcelerator/docker-elasticsearch-cluster:5.1.2
```

Where aNetwork is any swarm network
Minimum replicat is 3
The name of the service should be `elasticsearch`


It's possible to scale out using docker commande:

```
docker service scale elasticsearch=5 for instance to add node replicas
```
