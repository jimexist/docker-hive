# Docker Hive

Dockerize Hive

```sh
docker run --hostname hive --name hive --link postgresql -p 10000:10000 -p 9083:9083 -p 9000:9000 jimexist/docker-hive
```
