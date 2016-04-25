#!/bin/bash
set -e

/opt/consul/consul agent -server -config-dir=/config

if [ "${JOIN_CLUSTER_ADDRESS}" != "" ]
then
  /opt/consul/consul join ${JOIN_CLUSTER_ADDRESS}
fi  