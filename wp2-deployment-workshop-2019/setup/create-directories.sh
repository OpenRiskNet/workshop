#!/usr/bin/env bash

set -e

# You must be logged into the OpenShift command-line as the 'admin' user.
# Run on the NFS server to create 'N' NFS directories, the exports
# and persistent volumes.
#
# Usage: ./create-directories.sh <N>

if [ $# != 1 ]
then
  echo "Must specify number of directories to create"
  echo "Usage: ./create-directories.sh <N>"
  exit 1
fi

oc_user=$(oc whoami)
if [ ${oc_user} != 'admin' ]
then
  echo "You must be the 'admin' oc user"
  exit 1
fi

for i in $(seq 1 $1)
do
  user=user${i}
  dir=/exports/${user}-dir
  sudo mkdir -p ${dir}
  sudo chmod -R 777 ${dir}
  sudo chown -R nfsnobody.nfsnobody "${dir}"
  sudo echo "${dir} *(rw,root_squash)" | sudo tee -a /etc/exports.d/workshop.exports > /dev/null
  sed "s/%USER%/${user}/" pv-template.yaml > pv.yaml
  oc create -f pv.yaml > /dev/null
done

sudo systemctl restart nfs-server

oc get pv | grep pv-user
