#!/usr/bin/env bash

# Deletes 'N' users (user1..userN).
#
# Usage: sudo ./delete-users.sh <N>

if [ $# != 1 ]
then
  echo "Must specify number of users to delete"
  echo "Usage: ./delete-users.sh <N>"
  exit 1
fi

for i in $(seq 1 "$1")
do
  username=user$i
  sudo userdel -r "$username"
  echo "Deleted user $username"
done