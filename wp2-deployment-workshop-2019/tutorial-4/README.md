# Configuration

[toc](../README.md) | [prev](../exercise-d/README.md) | [next](../tutorial-5/README.md)

Here we describe how to configure your applications. 

---

Applications usually need configuring in some way. Maybe switching between production and development modes.
Maybe configuring logging. OpenShift provides a number of mechanisms for doing this:

* Environment variables
* Volumes
* ConfigMaps
* Secrets

We'll look at each of these in turn.

## Environment variables
These form part of the **Pod** specification and so can either be specified directly or as parameters if
using templates. For instance if we wanted to define an environment variable in our PySimple deployment
config then the spec section would look like this: -

```yaml
spec:
  containers:
  - name: pysimple
    image: alanbchristie/pysimple:2019.4
    env:
    - name: GREETING
      value: "Hello from the environment"
```

This would result in an environment variable being defined for the running container equivalent to had the following been
run: `export GREETING="Hello from the environment"`

If using a parameter it would look like this: -

```yaml
spec:
  containers:
  - name: pysimple
    image: alanbchristie/pysimple:2019.4
    env:
    - name: GREETING
      value: ${PARAM_NAME}
```
with the PARAM_NAME parameter being defined elsewhere in the template like this: -

```yaml
parameters:
- name: PARAM_NAME
  value: "Hello world!"
```

Environment variables can also be set from ConfigMaps and Secrets.
Mote to come on this later.

## Persistent Volumes
Volumes (see [Persistent storage](../tutorial-3/README.md)) could potentially contain configuration information.
More common is to mount a volume from a ConfigMap or Secret. A mounted volume can be a single file, allowing 
a configuration file to be defined. Typically this is rarely used as **ConfigMaps** provide a better
mechanism.

## ConfigMaps
A **ConfigMap** is a piece of data, typically text, that is defined externally to the pod (as a **ConfigMap** object)
allowing that data to be mounted into the running container as a volume or to define environment variables. In this way a configuration file can be
'injected' into your container, or a set of files can be injected.

To do this you need to:

1.  Create the **ConfigMap** with the required data.
1.  Define that **ConfigMap** as a volume in the **pod** (or **Deployment config**) spec
1.  Mount that volume into the container at the appropriate location or define
    environment variables from the contents of the **ConfigMap** 

See the [OpenShift documentation](https://docs.okd.io/latest/dev_guide/configmaps.html)
for more information on using **ConfigMaps**.


__EXAMPLE NEEDED__
 

## Secrets
**Secrets** are very like **ConfigMaps**, but the content is encrypted to hide it from prying eyes.
You might typically use a **Secret** for handling usernames, passwords or private keys.
In other aspects they behave the same as **ConfigMaps**.

A typical pattern is to generate a password in a template like this: -

```yaml
parameters:
- displayName: Database Admin Password
  description: Database postgres user password
  name: DB_ADMIN_PASSWORD
  from: "[a-zA-Z0-9]{20}"
  generate: expression
  required: true
```

Then in the same template use that generated parameter to create a **secret**
containing values for the username and password: -

```yaml
- kind: Secret
  apiVersion: v1
  metadata:
    name: database-secrets
    labels:
      application: postgresql-secrets
  stringData:
    database-admin-user: admin
    database-admin-password: "${DB_ADMIN_PASSWORD}"
```

Then to use that secret to define environment variables in the container: -

```yaml
spec:
template:
  metadata:
    name: database
  spec:
    ...
    containers:
    - name: database
      image: centos/postgresql-95-centos7
      env:
      - name: POSTGRESQL_ADMIN_USER
        valueFrom:
          secretKeyRef:
            name: database-secrets
            key: database-admin-user
      - name: POSTGRESQL_ADMIN_PASSWORD
        valueFrom:
          secretKeyRef:
            name: database-secrets
            key: database-admin-password
```

Using this process you will notice that: -

1. the password is randomly generated
1. no person needs to see the generated password - it is stored as a **secret**
1. the person deploying the database does not need to know the password

See the [OpenShift documentation](https://docs.okd.io/latest/dev_guide/secrets.html) for more information
on using **Secrets**.

---

[toc](../README.md) | [prev](../exercise-d/README.md) | [next](../tutorial-5/README.md)
