#!/usr/bin/env bash

# Creates 'N' htpassed users (user1..userN) with associated passwords.
# Results written to local file 'users.txt' and 'htpasswd'.
#
# Usage: sudo ./create-users.sh <N>
#
# Note:   Remember to set `PasswordAuthentication yes`
# ----    in the `/etc/ssh/sshd_config` file
#         and restart the sshd service with `sudo service sshd restart`.
#
#         When the workshop is over you should also remove the users,
#         reset the variable to `PasswordAuthentication no` and restart sshd.

if [ $# != 1 ]
then
  echo "Must specify number of users to create"
  echo "Usage: ./create-users.sh <N>"
  exit 1
fi

rm -f users.txt htpasswd
touch htpasswd

for i in $(seq 1 "$1")
do
  username=user$i
  password=$(< /dev/urandom tr -dc A-Z-a-z-0-9 | head -c12;echo;)
  echo "${username},${password}" >> users.txt
  sudo useradd -m -s /bin/bash "$username"
  echo "$password" | sudo passwd "$username" --stdin > /dev/null
  sudo htpasswd -b htpasswd "$username" "$password" &> /dev/null
  # Clone the workshop material...
  sudo git clone https://github.com/OpenRiskNet/workshop.git /home/${username}/workshop > /dev/null 2> /dev/null
  # Set the WORKSHOP_USER env variable...
  echo "export WORKSHOP_USER=${username}" | sudo tee -a /home/${username}/.bash_profile > /dev/null
  # Done
  echo "Created user $username"
done

echo "Look at users.txt and htpasswd"