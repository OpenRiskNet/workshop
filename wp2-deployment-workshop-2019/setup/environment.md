# Server setup instructions

These instructions are to help workshop organisers set up an environment
for running the workshop.

## VM setup

Create a virtual machine within the same cluster as OpenShift.

We assume a Centos7 machine will be used, though other flavours of Linux
should also be possible.

We assume there is a `centos` user with `sudo` access.

### Yum packages

```bash
yum install -y httpd-tools
```

### OC client

TODO

### User creation

Move into the `wp2-deployment-workshop-2019/setup` directory.

```bash
./create-users.sh 20
```

Adjust the number of users accordingly.

Two files will be created:

1. **users.txt** - usernames and plain text passwords that can be copied and
pasted into a spreadsheet for the users
2. **htpasswd** - a password file in httpd format that can be used to define 
OpenShift users.

The same password from the first file is encrypted in the second file.

## User deletion

```bash
./delete-users.sh 20
```
