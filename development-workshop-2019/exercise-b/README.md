# Development Workshop - Exercise A
Deploying the **PySimple** image from the OpenShift Command-Line.

>   This exercise is a repeat of **Exercise A**, which deployed using the
    OpenShift Web Console. In this exercise we use the OpenShift command-line
    tools.

## Installing the command-line tools
Follow the instructions in the **Log into the server** section of
[Exercise A](../exercise-a/README.md).

From the login page select the **Command Line Tools** option from the **Help**
dialogue (the **?** in a circle icon). You will have a link to the
**Latest Release** for OpenShift 3.11 where you can download and unpack a
suitable package for your OS (linux, Mac, Windows).

The **Command Line Tools** page also provides you with a login command and
_token_ to allow you to login to the OpenShift server from outside the cluster.

## Login
Login to the server by copying the example login command you were given on the
**Command Line Tools** page, which will be something like this: -

    oc login https://dev.openrisknet.org:8443 --token=1234

## Creating a namespace (project)
Use the command-line to create a project.

    oc new-project pysimple --display-name='PySimple' --description=PySimple Exercise B'

Using `--display-name` and `--description` is optional.

## Deploying the application image
You deploy applications from within a project.

You are automatically entered into new projects but, just in case you've
been elsewhere you can always make sure you're in the right project with
the command: -

    oc project pysimple

We can now deploy the application.

_TODO_
    
## Adding a Route
In order to access an application's **Service** from outside the cluster
you need to add a **Route**.

_TODO_

## Delete the project
Clean up by deleting the project.

_TODO_
