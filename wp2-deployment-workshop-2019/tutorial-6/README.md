# Advanced deployment techniques

[toc](../README.md) | [prev](../tutorial-5/README.md) | next

Here we describe alternative approaches to deploying applications that are
better suited for more complex applications.

---

## HELM charts

Typically Kubernetes deployments have been defined using HELM charts.
These are not widely used in OpenShift largely because of security concerns.
We therefore do not cover them in detail here, but for more information on HELM
look [here](https://helm.sh/).

# Ansible playbooks

[Ansible] is one of a number of open-source *Infrastructure As Code* (IaC)
tools typically used for automated application deployment, configuration
and orchestration.

Using YAML-based files, referred to as *playbooks*, users can configure almost
every aspect of a physical machine using *modules* provided by the tool.

## Advantages

-   Complete (parallel) control of multiple physical machines 
-   More than 2,800 built-in modules from package management using `apk`
    to `zfs` for managing zfs file systems
-   Simple Kubernetes object management via the built-in `k8s` module

## Examples

### Squonk

Describe the Squonk playbooks

# Ansible roles (and Ansible Galaxy)

[Roles] are a more structured variant of **playbooks**.

Ansible encourages *roles* over playbooks as they provide a much more flexible
way of configuring a physical machine by imposing a directory structure and
naming convention that allows its playbooks to be reused, easily (dynamically)
configured and shared with the community.

If properly configured, roles can also be shared via a public service Ansible
refers to as the [Galaxy].

## Advantages

All the advantages of playbooks plus: -

-   Structured
-   Dependency declarations
-   Easily shared
 
## Examples

### PySimple

Describe the PySimple role

# Operators

Operators are a relatively new concept in Kubernetes but are gaining big traction.
They provide a *Kubernetes native* approach to managing the whole lifecycle of an application,
not just its deployment. For instance an operator can handle deploying a database as well as
managing procedures for backing it up and restoring it from backups.

A well written operator should be able to be deployed to vanilla Kubernetes or to OpenShift.

Operators can be defined in a number of ways, using: -

-   HELM charts
-   Ansible roles
-   Go

## Examples

### PySimple

Describe the PySimple operator

---

[toc](../README.md) | [prev](../tutorial-5/README.md) | next

[ansible]: https://www.ansible.com/resources/get-started
[galaxy]: https://galaxy.ansible.com
[roles]: https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html
