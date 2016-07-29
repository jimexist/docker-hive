#!/bin/bash
/bin/bash /etc/bootstrap.sh
$HADOOP_PREFIX/bin/hadoop fs -mkdir -p /user/hive/warehouse

# start hive metastore
echo "starting metastore"
./bin/hive --service metastore &
# start hiveserver
echo "starting hive server2"
./bin/hiveserver2
