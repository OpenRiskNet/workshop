# Development Workshop - Exercise B

[toc](../README.md) | [prev](../tutorial-2/README.md) | [next](../exercise-c/README.md)

In this exercise we deploy the **PySimple** image from the OpenShift Command-Line.

---

>   This exercise is a repeat of **Exercise A**, which deployed the application
    using the OpenShift Web Console. In this exercise we use OpenShift's
    command-line tools.

>   For a full list of available commands you can visit the OpenShift v3.11
    [CLI reference] page.

## Move to correct location in the repo

Change directory to where the files for the exercise are located:

    cd ~/workshop/wp2-deployment-workshop-2019/exercise-b

## Login
Login to the server: -

    oc login -u ${WORKSHOP_USER} https://orn-master.informaticsmatters.com
    ...

## Creating a namespace (project)
Use the command-line to create a project: -

    oc new-project ${WORKSHOP_USER}-exercise-b

>   Project names in OpenShift have global scope so we must have unique names,
    hence why we include the username as part of the project name.

>   Using `--display-name` and `--description` for the `new-project` command
    is encouraged but optional.

## Deploying the application image
You deploy applications from within a project.

You are automatically entered into new projects as you create them but you can
always make sure you're in the right project with the command: -

    oc project ${WORKSHOP_USER}-exercise-b

You can see which project you're in with the command: -

    oc project

We can now deploy the application.

We could do it in a similar way to the way we did with the web console and
just say create a new app with the PySimple container, but instead we'll do
this is a more controlled manner using templates that define the OpenShift
objects that we are wanting to be created. 

But first we need to briefly discuss OpenShift _templates_.

As we're not using the console we use files to provide templates that describe
the object that are need to satisfy the application.

To do this we need to understand what Kubernetes objects will be required
to deploy an application. This is not always obvious, made more complex
by the fact that there are large number of objects available in Kubernetes.

>   We don't have time to explain templates or the objects they describe in
    detail in this exercise but we have created the templates for PySimple
    for you.

In this exercise we need templates to create: -

-   the application container (using a **DeploymentConfiguration**)
-   a port for HTTP communication (using a **Service**)
-   an external route (using a **Route**)

Templates are typically crafted using YAML-based text files. You can find
our ready-made templates in the exercise directory.

>   You can combine all of your objects into a single _template_ file but
    it's often wise to arrange your application objects using a
    _one-file-one-object_ pattern, which can help when automating
    deployments.

From the `exercise-b` directory we can install the application's container
(a **DeploymentConfiguration**), its *Service**  and **Route** with the
following commands: -

    oc process -f deployment-config.yaml | oc create -f -
    oc process -f service.yaml | oc create -f -
    oc process -f route.yaml | oc create -f -

>   In the above we're actually running two commands for each template.
    We run the `process` command on each template to compile it into a form
    usable by OpenShift. IOn the second part, we _pipe_ the output of the
    process stage into the `create` command, which creates objects in our
    project.

If you navigate to the OpenShift web console you should see your project
and, once the container is pulled from DockerHub and is running the
**Overview** screen, once expanded, should look something like this: -

![](screen-3.png)
    
Click on the route's link to visit the application, or you can use
`curl` from the command-line: -

    curl http://pysimple-${WORKSHOP_USER}-exercise-b.orn.informaticsmatters.com/

## Scaling the application
With the application running we can scale it up and down by
setting the number of _replicas_ for the application's container.

>   The initial replica count is declared in the **DeploymentConfig** template
    file but we can easily adjust it from the command-line.

To scale our application's container replica count to zero,
stopping the container, we can run: -

    oc scale deploymentconfig/pysimple --replicas=0

If you visit the **Overview** page for your application you will see
that the container (known as a **Pod** on Kubernetes) has been scaled to
zero: -

![](screen-4.png)

>   Many object names can be abbreviated, the above command can
    also be shortened to `oc scale dc/pysimple --replicas=0`

The replica state can also be confirmed by _describing_ the deployment
object using the command-line tools: -

    oc describe dc/pysimple | grep Replicas

Which should return something like the following: -

    Replicas:	0
	Replicas:	0 current / 0 desired

To restore the original replica value of 1, it's simply: -

    oc scale dc/pysimple --replicas=1

We can scale the number of replicas beyond 1, which will essentially provide
more than one endpoint behind the **Service**. In this instance the **Service**
acts as an internal load-balancer for all the **Pods** it finds.

>   Obviously no all applications benefit from scaling in this way,
    especially with stateful services where sessions will need to be
    used to preserve connections to individual containers.

To create two instances of the application run: -

    oc scale dc/pysimple --replicas=2

## Investigating resilience
Let's see what happens if your container (**Pod**) dies. 

>   It will more dramatic if you have the console's application **Overview**
    screen visible while you run the next few commands.

First list your pods (if you scaled to 2 replicas above you should see 2 pods):

    oc get pod

...and copy the name of one of them (something like `pysimple-1-4df47a5`).

Now let's delete that pod, simulating the situation where it might have crashed,
or the server on which it was running crashed.

    oc delete pod/pysimple-1-4df47a5

Replace the last part with the actual name of your pod. And, yes,
**really** delete it. No harm will be done!

>   If you do have the **Overview** screen visible you'll get a dynamic visual
    rendering of what happens to deployments of Pods that die. Alternatively,
    for a less dramatic view execute `oc get pod` on the CLI.

You will notice that quite quickly OpenShift will notice that the required
number of pods are not running and will rectify this by starting a new one.

OpenShift creates a new running instance of your container image and
might possibly even use a different physical compute instance on which to
run it (if the node had actually crashed it would definitely do so).

During all this, with more than one `replica`, there was no disruption to your
service as the other pod was still running.

## Delete the project
Clean up by deleting the project.

To delete the PySimple project simply run: -

    oc delete project/${WORKSHOP_USER}-exercise-b
    
Remember that projects can take a some time to
disappear so, if you wish, you can always check with the console
to make sure it gets deleted.

---

[toc](../README.md) | [prev](../tutorial-2/README.md) | [next](../exercise-c/README.md)

[cli reference]: https://docs.openshift.com/container-platform/3.11/cli_reference/basic_cli_operations.html
