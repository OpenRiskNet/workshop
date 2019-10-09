#!/usr/bin/env bash

# Creates 'N' htpassed users (user1..userN) with asscoiated passwords.
# Results written to local file 'users.txt' and 'htpasswd'.
#
# Usage: sudo ./create-users.sh <N>

if [ $# != 1 ]
then
  echo "Must specify number of users to create"
  echo "Usage: ./create-users.sh <N>"
  exit 1
fi

rm -f users.txt htpasswd
touch htpasswd

for i in $(seq 1 $1)
do
  username=user$i
  password=`< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-12};echo;`
  echo "${username},${password}" >> users.txt
  sudo useradd -m -s /bin/bash $username
  echo $password | passwd $username --stdin > /dev/null
  sudo htpasswd -b htpasswd $username $password &> /dev/null
  echo "Created user $username"
done

echo "Look at users.txt and htpasswd"