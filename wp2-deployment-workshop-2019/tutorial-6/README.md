# Advanced deployment techniques

[toc](../README.md) | [prev](../tutorial-5/README.md)

Here we describe alternative approaches to deploying applications that are
better suited for more complex applications.

---

# HELM charts

Typically Kubernetes deployments have been defined using HELM charts.
These are not widely used in OpenShift largely because of security concerns.
We therefore do not cover them in detail here, but for more information on HELM
look [here](https://helm.sh/).

---

# Ansible playbooks

[Ansible] is one of a number of open-source *Infrastructure As Code* (IaC)
tools typically used for automated application deployment, configuration
and orchestration.

Using YAML-based files, referred to as *playbooks*, users can configure almost
every aspect of a physical machine by defining *tasks* that use the *modules*
provided by the tool.

For example, the following very simple excerpt defines a task that results
in the command-line execution of `oc get pvc` with the result (stdout) written
to the variable `pvc_result`: -

```yaml
- name: Get known PVCs (current project)
    command: oc get pvc
    register: pvc_result
```

## Advantages

-   Complete (parallel) control of multiple physical machines 
-   More than 2,800 built-in modules from package management using `apk`
    to `zfs` for managing zfs file systems
-   Simple and richer Kubernetes object management via the built-in `k8s` module
-   Richer dynamic control of objects (Ansible variables and [jinja] templating)

## Examples

### Squonk

The [Squonk Computational Notebook] is a complex application consisting of
numerous container images that also rely on additional infrastructure
components that include: -

-   a messaging framework based on [RabbitMQ]
-   a PostgresQL database
-   an authentication service based on [Keycloak] 

To orchestrate the suite of containers and configure the database and
authentication service a number of playbooks and object templates have been
developed, resulting in simple one-click installation of the application
and its orchestration formed from: -

-   **26** Ansible *playbooks*
-   **6** Ansible *roles*
-   **90+** Role playbook files
-   **50+** Kubernetes/OpenShift YAML template files
-   **100+** variables

The open-source repository contains some interesting **OpenShift templates**
that include: -

-   **ConfigMap** and **Job** object templates for database user-creation
    ([infra-db-create.yaml](https://raw.githubusercontent.com/InformaticsMatters/squonk/master/openshift/ansible/roles/infra/files/infra-db-create.yaml))
-   **ConfigMap** and **Job** object templates for Keycloak configuration
    ([squonk-infra-keycloak-init.yaml](https://raw.githubusercontent.com/InformaticsMatters/squonk/master/openshift/ansible/roles/squonk/files/squonk-infra-keycloak-init.yaml))
-   **CronJob** object templates for regular database backups
    ([postgres.yaml](https://raw.githubusercontent.com/InformaticsMatters/squonk/master/openshift/ansible/roles/infra/files/postgres.yaml)) 
-   **DeploymentConfig** and **Service** for PostgreSQL
    ([postgres-backup-hourly.yaml](https://raw.githubusercontent.com/InformaticsMatters/squonk/master/openshift/ansible/roles/infra/files/postgres-backup-hourly.yaml))
-   **Secrets**
    ([postgres-secrets.yaml](https://raw.githubusercontent.com/InformaticsMatters/squonk/master/openshift/ansible/roles/infra/files/postgres-secrets.yaml))
-   **PersistentVolume** and corresponding **PersistentVolumeClaim** object templates (NFS)
    ([squonk-pv-nfs.yaml](https://raw.githubusercontent.com/InformaticsMatters/squonk/master/openshift/ansible/roles/squonk/files/squonk-pv-nfs.yaml))
    ([squonk-pvc-nfs.yaml](https://github.com/InformaticsMatters/squonk/blob/master/openshift/ansible/roles/squonk/files/squonk-pvc-nfs.yaml))

Some Ansible **k8s module** templates that include: -

-   **DeploymentConfig** ([cellexecutor-deployment.yaml.j2](https://raw.githubusercontent.com/InformaticsMatters/squonk/master/openshift/ansible/roles/squonk/templates/cellexecutor-deployment.yaml.j2]())
-   **Service** ([cellexecutor-service.yaml.j2](https://raw.githubusercontent.com/InformaticsMatters/squonk/master/openshift/ansible/roles/squonk/templates/cellexecutor-service.yaml.j2))
-   **ImageStream** ([cellexecutor-imagestream.yaml.j2](https://raw.githubusercontent.com/InformaticsMatters/squonk/master/openshift/ansible/roles/squonk/templates/cellexecutor-imagestream.yaml.j2))

And Ansible Role **playbooks** that include orchestrating: -

-   Database users
    ([create-user-db.yaml](https://raw.githubusercontent.com/InformaticsMatters/squonk/master/openshift/ansible/roles/infra/tasks/create-user-db.yaml))
-   Extraction of Keycloak authentication tokens
    ([get-keycloak-token.yaml](https://raw.githubusercontent.com/InformaticsMatters/squonk/master/openshift/ansible/roles/infra/tasks/get-keycloak-token.yaml))
-   Service accounts
    ([create-service-account.yaml](https://raw.githubusercontent.com/InformaticsMatters/squonk/master/openshift/ansible/roles/infra/tasks/create-service-account.yaml))
-   Ansible k8s module templates
    ([squonk-app.yaml](https://raw.githubusercontent.com/InformaticsMatters/squonk/master/openshift/ansible/roles/squonk/tasks/squonk-app.yaml))

---

# Ansible roles (and Ansible Galaxy)

[Roles] are a more structured variant of **playbooks**.

Ansible encourages *roles* over playbooks as they provide a much more flexible
way of configuring a physical machine by imposing a directory structure and
naming convention that allows its playbooks to be reused, easily (dynamically)
configured and shared with the community.

If properly structured, roles can also be easily shared via a public service
Ansible refers to as the [Galaxy].

## Advantages

All the advantages of playbooks plus: -

-   Structure
-   Community sharing via Ansible Galaxy
-   Meta-data and dependency declarations
-   Unit and functional test framework
 
## Examples

### PySimple

The **PySimple** application we've been deploying during the workshop is
available as an Ansible role, published to [Galaxy]. The role source is
available on [GitHub](https://github.com/alanbchristie/ansible-role-PySimple).

Variables are typically defined in the `defaults/main.yml` file where you'll
find the variables that control the PySimple deployment.

To use a Galaxy role define it with the aid of a `requirements.yml`
file: -

```yaml
- src: alanbchristie.pysimple
  version: 1.0.0
```

And install it using the `ansible-galaxy` tool: -

    ansible-galaxy install -r requirements.yml
    
And execute it, defining any role variables from with a *playbook*
(or *role*) with a simple YAML construct: -

```yaml
- hosts: servers
  tasks:
  - include_role:
      name: alanbchristie.pysimple
    vars:
      image_tag: '2019.5'
```

---
  
# Operators

Operators provide Kubernetes application orchestration and configuration and
are distributed as container images.

Operators are a relatively new concept in Kubernetes but are gaining big traction.
They provide a containerised *Kubernetes native* approach to managing the whole
lifecycle of an application, not just its deployment. For instance an operator
can handle deploying a database as well as managing procedures for upgrading,
backing it up and restoring it from backups.

## Advantages

-   A well written operators can be deployed to Kubernetes or to OpenShift
-   Provide full-lifecycle control of applications
-   Business logic distributed as a container image
-   Can defined in a number of ways: -
    -   HELM charts (although limited functionality)
    -   Ansible roles
    -   Go

## Examples

### PySimple

The **PySimple** application we've been deploying during the workshop is
available as a simple Kubernetes *ansible operator*. The operator is
available on [GitHub](https://github.com/alanbchristie/ansible-operator-PySimple)
and deploys the PySimple *role* into Kubernetes or OpenShift.
 
A description of the operator and example use can be found in the
project's GitHub documentation.

# Further information

We have plenty more information in the [openrisknet/home](https://github.com/OpenRiskNet/home) GitHub repository.
In particular you might want to take a look at:

* [Recipes](https://github.com/OpenRiskNet/home/tree/master/openshift/recipes) - quick 'howto' guides for a wide range 
of OpenShift related tasks.
* [Deployments](https://github.com/OpenRiskNet/home/tree/master/openshift/deployments) - complete deployment instructions
for the OpenRiskNet partner applications and related applications. 

---

[toc](../README.md) | [prev](../tutorial-5/README.md)

[ansible]: https://www.ansible.com/resources/get-started
[galaxy]: https://galaxy.ansible.com
[jinja]: https://palletsprojects.com/p/jinja/
[keycloak]: https://www.keycloak.org
[rabbitmq]: https://www.rabbitmq.com
[roles]: https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html
[squonk computational notebook]: https://squonk.it
