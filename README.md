# Docker Hive

[![Build Status](https://travis-ci.org/Jimexist/docker-hive.svg?branch=master)](https://travis-ci.org/Jimexist/docker-hive)
[![Docker Pulls](https://img.shields.io/docker/pulls/jimexist/docker-hive.svg)](https://hub.docker.com/r/jimexist/docker-hive/)

Dockerize Hive

```sh
docker run --hostname hive --name hive --link mysql:3306 -p 10000:10000 -p 9083:9083 -p 9000:9000 jimexist/docker-hive
```