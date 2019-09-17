# Configuration

[toc](../README.md) | [prev](../exercise-d/README.md) | next

Here we describe how to configure your applications. 

---

Applications usually need configuring in some way. Maybe swiching between production and development modes.
Maybe configuring logging. OpenShift provides a number of mechanisms for doing this:

* Environment variables
* Volumes
* ConfigMaps
* Secrets

We'll look at each of these in turn.

## Environment variables
These form part of the **pod** specification and so can either be specified directly or as parameters if
using templates. For instance if we wanted to define an environment variable in our PySimple deployment
config then the spec section would look like this:
```
	spec:
	  containers:
	  - name: pysimple
		image: alanbchristie/pysimple:2019.3
		env:
		- name: GREETING
		  value: "Hello from the environment"
```
This would result in an environment variable being defined for the running container equivalent to had the following been
run: `export GREETING="Hello from the environment"`

If using a parameter it would look like this:

```
	spec:
	  containers:
	  - name: pysimple
		image: alanbchristie/pysimple:2019.3
		env:
		- name: GREETING
		  value: ${PARAM_NAME}
```
with the PARAM_NAME parameter being defined elsewhere in the template like this:

```
parameters:
- name: PARAM_NAME
  value: "Hello world!"
```

Environment variables can aslo be set from ConfigMaps and Secrets. Mote to come on this later.

## Volumes
Volumes (see [Persistent storage](../tutorial-3/README.md) could potentially contain configuration information.
More common is to mount a volume from a ConfigMap or Secret. A mounted volume can be a single file, allowing 
a configuration file to be defined.

## ConfigMaps
A **ConfigMap** is a peice of data, typically text, that is defined externally to the pod (as a ConfigMap object)
allowing that data to be mounted into the running container as a volume. In this way a configuration file can be
'injected' into your container, or a set of files can be injected.

To do this you need to:

1. create the ConfigMap with the required data.
2. Define that ConfigMap as a volume in the pod (or deployment config) spec
3. Mount that volume into the container

See the [OpenShift documentation](https://docs.okd.io/latest/dev_guide/configmaps.html) for more information
on using **ConfigMaps**.


__EXAMPLE NEEDED__
 

## Secrets
**Secrets** are very like **ConfigMaps**, but the content is encrypted to hide is from prying eyes.
You might typically use a **Secret** for handling usernames, password or private keys.
In all other aspects they behave the same as **ConfigMaps**.

See the [OpenShift documentation](https://docs.okd.io/latest/dev_guide/secrets.html) for more information
on using **Secrets**.

