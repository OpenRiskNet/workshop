# Workshop setup

[toc](../README.md) | [next](../tutorial-1/README.md)

Here we describe getting setup for the workshop

---

## What you'll need

1. A modern web browser
2. The `oc` command line tool
3. A login for the OpenShift environment

## User account

Each attendee will have their own user account for performing the exercises. A number of users 
(user1, user2, ...) have been setup with passwords. Open 
[this Google sheet](https://docs.google.com/spreadsheets/d/1HUgsfSz3dyRDPXQq55t_bGhoDw9CS7U6d1oHadJg94s)
to see these users and write your name in the `owner` column to claim that username (once you have entered 
your name reload the page in your browser to ensure that you have successfully claimed that username).

That username and password will be used for your login to OpenShift and your login to the shared server.

## Naming etiquette

When it comes to creating OpenShift project please conform to a convention that allows to identify your project. The convention is that the project should be named `username-exercise`. For insatance if you are `user7` and 
are working on `exercise C` then name your project `user7-exercisec`. This avoids name clashes and makes it 
easier or the workshop organisers to step in and assist. 

## Accessing the oc command line tool

`oc` is a program that lets you execute commands against the OpenShift API. If you are familiar with Kubernetes
then `oc` is an extension of the `kubectl` program, adding some OpenShift specific commands.

### oc through a login on the shared acccess machine.

To avoid the need to install `oc` on your computer we have set up a simple Linux virtual machine that has `oc` already installed. Each user in the Google sheet mentioned above has a login with the corresponding password.

To login you will need a `ssh` client on your computer. Linux, Mac and recent Windows 10 machines will have
that pre-installed. For older Windows machines you might want to download and install 
[Putty](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html).

To login do something like this:

```
ssh <user>@<server>
password:
$ 

```

### Installing oc on your computer

Alternatively you can download and install `oc` on your laptop.
Download the appropriate version. See the `Download oc Client Tools` section [here](https://www.okd.io/download.html).

You should just need to download the file, unzip it and make sure that the `oc` binary is on your PATH.

## Logging in to Openshift

### Web browser

Go to <url> and enter the username and password your claimed in the previous section.
Once logged in you will see a page like this:

<screenshot>

### Using oc

```
oc login -u <useranme> https://server 
...
oc whoami
```

## Minishift

In the workshop you will be using a test OpenShift environment running externally.
This environment will not be available after the workshop. If you wish to continue with these
exercises after the workshop then you might want to consider running `Minishift` which is a mini
OpenShift environment that can be run on your laptop. Once started Minishift provides a fully
functional local OpenShift environment that can be used for development.

See [these instructions](https://docs.okd.io/latest/minishift/getting-started/installing.html)
for insalling and running Minshift.

---
[toc](../README.md) | [next](../tutorial-1/README.md)


