# Docker Hive

Dockerize Hive

```sh
docker run --hostname hive --name hive --link mysql:3306 -p 10000:10000 -p 9083:9083 -p 9000:9000 jimexist/docker-hive
```