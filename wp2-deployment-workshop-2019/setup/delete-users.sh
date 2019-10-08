#!/usr/bin/env bash

if [ $# != 1 ]
then
  echo "Must specify number of users to delete"
  exit 1
fi

for i in $(seq 1 $1)
do
  username=user$i
  userdel -r $username
  echo "Deleted user $username"
done