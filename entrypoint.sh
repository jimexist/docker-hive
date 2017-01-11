#!/bin/bash
set -euf -o pipefail

. /etc/bootstrap.sh

echo "leaving namenode safemode..."
$HADOOP_PREFIX/bin/hdfs dfsadmin -safemode leave

echo "making directory for Hive metastore"
$HADOOP_PREFIX/bin/hadoop fs -mkdir -p /user/hive/warehouse

echo "initializing metastore"
./bin/schematool -dbType mysql -initSchema

echo "starting metastore"
./bin/hive --service metastore &

echo "starting hive server2"
exec ./bin/hiveserver2
