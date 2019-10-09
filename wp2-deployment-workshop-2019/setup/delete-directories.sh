#!/usr/bin/env bash

# You must be logged into the OpenShift command-line as the 'admin' user.
# Run on the NFS server to delete 'N' NFS directories, the exports
# and persistent volumes.
#
# Usage: ./delete-directories.sh <N>

if [ $# != 1 ]
then
  echo "Must specify number of directories to delete"
  echo "Usage: ./delete-directories.sh <N>"
  exit 1
fi

oc_user=$(oc whoami)
if [ "${oc_user}" != 'admin' ]
then
  echo "You must be the 'admin' oc user"
  exit 1
fi

for i in $(seq 1 "$1")
do
  user=user${i}
  oc delete pv/pv-"${user}" > /dev/null
done

sudo rm /etc/exports.d/workshop.exports
sudo systemctl restart nfs-server

for i in $(seq 1 "$1")
do
  user=user${i}
  dir=/exports/${user}-dir
  sudo rm -rf "${dir}"
done
