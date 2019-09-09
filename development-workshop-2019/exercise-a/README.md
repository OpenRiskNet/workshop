# Development Workshop - Exercise A
Deploying the **PySimple** image from the OpenShift Web Console.

This exercise uses the OpenRiskNet OpenShift Web Console to deploy a
container image from a public registry (docker.io). 

## Logging into the server
Using a web browser (ideally Google Chrome) navigate to the OpenRiskNet
OpenShift Development Web Console at [https://dev.openrisknet.org:8443/](https://dev.openrisknet.org:8443/)
where you'll be presented with the login page.

_SCREENSHOT_

Here, enter the **username** and **password** you've been assigned.

## Creating a namespace (project)
Application are deployed to _namespaces_.

1.  To create a namespace (project) for the application click the
    blue **+ Create Project** button in the top-right of the console.
1.  Provide a **Name** for the porject. Project names may only contain
    lower-case letters, numbers, and dashes and must begin with a letter or
    number. The name is arbitrary but, as we're deploying PySimple,
    let's call it `pysimple`.
    1.  You can provide an optional **Display Name**, which does not have the
        same content restrictions as the **Name**, and a **Description** 
1.  Click **Create** and your project should appear in the **My Projects**
    panel.
    
_SCREENSHOT_

## Deploying the application image
You deploy applications from within a project.

1.  From the list of your projects click the **PySimple** project you just
    created. Here you should be greeted by a page explaining how you can
    **Get started with your project**.
1.  Click the **Deploy Image** button and select the **Image Name** option.
1.  Enter the registry name of the image. As we're using a pre-existing image
    simply enter the image name, e.g. `alanbchristie/pysimple:latest`
    and then hit **Return**. Without a registry OpenShift assumes `docker.io`
    but you can add a registry if you want.
1.  OpenShift queries the image and, after a few moments, displays
    some brief information about it. Here it understands that the image
    opens port `8080` and so a **Service** to access that port will be created.
    1.  You can change the **Name** of the image, but we'll leave it as
        `pysimple`.
    1.  You have an opportunity to define **Environment Variables**. As
        `pysimple` does not expose any we can can skip this.
    1.  You can also add **Labels** to objects that get created.
        It's unnecessary for this example to leave these at their default
        values.
1.  Click the blue **Deploy** button to start the application deployment.

Click the **Continue to the project overview** link on the subsequent page
to be taken to to the project's **Overview** panel.

You should see the application deployment progress where the image is first
pulled from the public registry, and passes through an initialisation phase
before setting down into a _Running_ state indicated by a dark blue circle.

You should eventually see an **Overview** that should look like the
following: -

_SCREENSHOT_

## Adding a Route
In order to access an application's **Service** from outside the cluster
you need to add a **Route**.

1.  From the project **Overview** page click the **Create Route** text in the
    **NETWORKING** section.
1.  For this example you can leave all the options at their default values.
    This will create an unsecured **Route** from outside the cluster to the
    application's **Service**.
1.  Click the blue **Create** button at the bottom of the screen.

You should see a **Route Created** notification as you're returned to a
compact view of the projects's **Overview**. You should now have a URL
that connects you to the application.

Click the URL and you should be taken to the **PySimple** HTTP
page which should say **Hello world!** along with
**No Redis container, counter disabled**

_SCREENSHOT_

## Delete the project
Clean up by deleting the project.

1.  To delete the project, which deletes the namespace and all the objects we've
    created (including the Route) navigate to your console's landing page
    by clicking the **okd** icon in the top left of the console window.
1.  You should be returned to the start and you should see the **My Projects**
    panel on the right.
1.  Click the vertical ellipses (`...`) ans select **Delete Project**.
    1.  Enter you project **Name** (e.g. `pysimple`) in the dialogue box
        and then click the red **Delete** button to begin the deletion process.
    1.  The project is _marked for deletion_ but this simple project should
        be removed after a few moments.
