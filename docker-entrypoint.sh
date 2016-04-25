#!/bin/bash
set -e

/opt/consul/consul agent -server -config-dir=/config -bootstrap-expect ${BOOTSTRAP_EXPECT}

if [ "${JOIN_CLUSTER_ADDRESS}" != "" ]
then
  /opt/consul/consul join ${JOIN_CLUSTER_ADDRESS}
fi  