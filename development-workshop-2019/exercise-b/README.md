# Development Workshop - Exercise B
Deploying the **PySimple** image from the OpenShift Command-Line.

>   This exercise is a repeat of **Exercise A**, which deployed the application
    using the OpenShift Web Console. In this exercise we use OpenShift's
    command-line tools.

## Installing the command-line tools
Follow the instructions in the **Log into the server** section of
[Exercise A](../exercise-a/README.md).

From the login page select the **Command Line Tools** option from the **Help**
dialogue (the **?** in a circle icon). You will have a link to the
**Latest Release** for OpenShift 3.11 where you can download and unpack a
suitable package for your OS (linux, Mac, Windows).

_SCREENSHOT_

The **Command Line Tools** page also provides you with a login command and
_token_ to allow you to login to the OpenShift server from outside the cluster.

_SCREENSHOT_

## Login
Login to the server by copying the example login command you were given on the
**Command Line Tools** page, which will be something like this: -

    oc login https://dev.openrisknet.org:8443 --token=1234

## Creating a namespace (project)
Use the command-line to create a project.

    oc new-project pysimple --display-name='PySimple' --description='PySimple (Exercise B)'

>   Using `--display-name` and `--description` is preferred but optional.

## Deploying the application image
You deploy applications from within a project.

You are automatically entered into new projects as you create them but,
just in case you've been elsewhere, you can always make sure you're in the
right project with the command: -

    oc project pysimple

You can see which project you're in with the command: -

    oc project

We can now deploy the application.

But first we need to briefly discuss OpenShift _templates_.

>   As we're not using the console we need to provide templates for the objects
    that need to be created. To do this we need to understand what Kubernetes
    objects will be required to deploy an application. This is not always
    obvious, made more complicated by the fact that there are large number of
    objects available in Kubernetes.

>   We don't have time to explain each object in this exercise but we have
    created templates for you.

>   In this exercise we need to create templates to describe the application
    container (a **DeploymentConfiguration**) and, as our application
    exposes a port for HTTP communication, a **Service**. We have also add a
    **Route** definition, which avoids the need to create a Route manually
    via the console as we saw in **Exercise A**.

>   Templates are typically crafted using YAML-based text file. You can find
    our ready-made templates in the exercise directory.

>   You can combine all of your objects into a single _template_ file but
    it's often wise to arrange your application objects using a
    _one-file-one-object_ pattern, which often helps when automating
    deployments.

>   To deploy the application we need to _process_ each template, essentially
    compiling the YAML file into a form usable by OpenShift. Once processed we
    then _create_ objects from the processed result.

From the `exercie-b` directory we can install the application's container
(a **Deployment**) and its *Service** with the following two commands: -

    oc process -f deployment-config.yaml | oc create -f -
    oc process -f service.yaml | oc create -f -

If you navigate to the OpenShift web console you should see your project
and, once the container is pulled from DockerHub and is running the
**Overview** screen should look something like this: -

_SCREENSHOT_
    
## Adding a Route
In order to access an application's **Service** from outside the cluster
you need to add a **Route**. You can use the console as you did in
**Exercise A** or you can do this from the command-line with using our
convenient `route.yaml` template file: -

    oc process -f route.yaml | oc create -f -

If you return to the Web Console your application **Overview** should now
indicate that the **Route** has been applied.

_SCREENSHOT_

Click on the route's link to visit the application, or you can use
`curl` from the command-line: -

    curl http://pysimple-pysimple.dev.openrisknet.org/

## Scaling the application
With the application running we can scale it up and down by
setting the number of _replicas_ for the application's container.

>   The initial replica count is declared in the **DeploymentConfig** template
    file but we can easily adjust it from the command-line.

To scale our application's container replica count to zero,
stopping the container, we can run: -

    oc scale deploymentconfig/pysimple --replicas=0

Many object names can be abbreviated, the above command can also be shortened
to: -

    oc scale dc/pysimple --replicas=0

The replica state can be confirmed by visiting the application's **Overview**
page on the Web Console or by _describing_ the deployment object using the
command-line tools: -

    oc describe dc/pysimple | grep Replicas

Which should return something like the following: -

    Replicas:	0
	Replicas:	0 current / 0 desired

To restore the original replica value of 1 it's simply: -

    oc scale dc/pysimple --replicas=1

## Delete the project
Clean up by deleting the project.

To delete the PySimple project simply run: -

    oc delete project/pysimple
    
Project deletion can take a few moments, you can always wait for deletion
with the command: -

    oc wait project/pysimple --for=delete
