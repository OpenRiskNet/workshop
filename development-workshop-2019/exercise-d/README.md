# Development Workshop - Exercise D
Giving applications **Persistent Storage** (Dynamic).

We'll re-deploy the **PySimple** application but this time give it some
persistent storage so that we're able to preserve data between container
restarts.

>   Here we assume that you've successfully worked through exercises **A**
    and **B** and have the OpenShift command-ine tools available and are
    logged into the workshop's OpenSHift cluster.

## Login and create a project
Login to the server by copying the example login command you were given on the
**Command Line Tools** page, which will be something like this: -

    oc login https://dev.openrisknet.org:8443 --token=1234
    oc new-project pysimple --display-name='PySimple' --description='PySimple (Exercise D)'

## Claiming storage
In order to use an external (persistent) volume we need to make a _claim_.

A claim is defined using a **PersistentVolumeClaim** object. We have
created an example for you in the `exercise-d` directory, a small 1GiB
volume. Like all other objects you use the command line _process_ and
_create_ commands to make the claim.

>   If no default is provided claims can declare a `storageClass`.
    The storage classes available to you will be created by the cluster
    administrator. You can see the storage classes available to you
    with the command `oc get storageclass`
 
    oc process -f persistent-volume-claim.yaml | oc create -f -

>   The claim belongs to a namespace (project), only containers in the named
    namespace can use the claim.

## Using storage
We declare `volumes` in our application deployment when we want to attach
external, persistent volumes.

The **DeploymentConfig** in this exercise extends the one in `exercise-b`
by add a `volume` declaration and a `vgolumeMount`. The `volume` attaches the
claim to the container and the `volumeMount` defines its mount-point in the
container.

## Deploying the application image
Just as we did with **Exercise B** let's deploy the application, which consists
of a **DeploymentConfig**, **Service** and **Route**: -

    oc process -f deployment-config.yaml | oc create -f -
    oc process -f service.yaml | oc create -f -
    oc process -f route.yaml | oc create -f -

>   This application mounts an external volume into the container's
    `/data` directory. Any material stored there is therefore persisted
    between container restarts.

## Demonstrating persistence
Let's delete the application's deployment, which stops the container and
removes the image from the project. When we re-create the application
we'lll see that, as we've not removed the **PersistentVolumeClaim **, it
has the disk-based files it originally created.

First, check the application/s response with curl: -

    curl http://pysimple-pysimple.dev.openrisknet.org/

You should get a value for `Num visits` that is `1`.

Lets's delete, wait and then re-create the application...

    oc delete dc/pysimple
    oc wait dc/pysimple --for=delete
    oc process -f deployment-config.yaml | oc create -f -

If we `curl` the application's **Route** now we'll see that the `Num visits`
is now `2`. The application was re-deployed but data was persisted.

## Delete the project
Clean up by deleting the project.

To delete the PySimple project, which also deletes the **PersistentVolumeClaim**
and (in our case) the underlying storage, simply run: -

    oc delete project/pysimple
