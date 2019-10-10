#!/usr/bin/env bash

set -e

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
#
# Note:   On the OpenShift master you will need to add the `htpasswd`
# ----    content to `/etc/origin/master/htpasswd`, remembering to remove it
#         when the workshop is over.
#
# Note:   For exercise c you will need to add the default service accounts
# ----    on the master to the list of `users:` using the command
#         `oc edit scc privileged`. For each user you will need the
#         following line, where `<N>` is the user number: -
#
#         - system:serviceaccount:user<N>-exercise-c:default

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
  sudo git clone https://github.com/OpenRiskNet/workshop.git /home/"${username}"/workshop > /dev/null 2> /dev/null
  sudo chown -R "${username}"."${username}" /home/"${username}"/workshop
  # Set the WORKSHOP_USER env variable...
  echo "export WORKSHOP_USER=${username}" | sudo tee -a /home/"${username}"/.bash_profile > /dev/null
  # Done
  echo "Created user $username"
done

# Get OC (into /bin)
wget https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz
tar -xvf openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz
sudo cp openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/oc /bin

echo "Look at users.txt and htpasswd"