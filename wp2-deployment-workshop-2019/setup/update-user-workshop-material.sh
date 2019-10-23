#!/usr/bin/env bash

set -e

# To run on the Wokshop student VM.
#
# You are expected to have previously executed 'create-users.sh'.
# This script uopdates the git material for each user, you'd
# run this if you've changed the material after creating the users.
#
# Caution: Running this will erase any local changes to the user's
# -------  workshop files as it runs `git reset --hard`
#
# Usage: sudo ./update-user-workshop-material.sh <N>

if [ $# != 1 ]
then
  echo "Must specify number of users to update"
  echo "Usage: ./update-user-workshop-material.sh <N>"
  exit 1
fi

for i in $(seq 1 "$1")
do
  username=user$i
  # Update the workshop material...
  sudo cd /home/"${username}"/workshop
  sudo git reset --hard 2>&1
  sudo git pull 2>&1
  sudo chown -R "${username}"."${username}" /home/"${username}"/workshop
  # Done
  echo "Updated user $username"
done

echo "Done!"
