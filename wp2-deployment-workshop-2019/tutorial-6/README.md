# Advanced deployment techniques

[toc](../README.md) | [prev](../tutorial-5/README.md) | next

Here we describe alternative approaches to deploying applications that are
better suited for more complex applications.

---

## HELM charts

Typically Kubernetes deployments have been defined using HELM charts. These are not widely used in OpenShift largely
because of security concerns. We therefore do not cover them in detail here, but for more information on HELM look
[here](https://helm.sh/).

# Ansible playbooks

Suited for more complex deployments.

## Advantages

List the pros and cons of using Ansible

## Examples

### PySimple

Describe the PySimple playbooks

### Squonk

Describe the Squonk playbooks

# Operators

Operators are a relatively new concept in Kubernetes but are gaining big traction.
They provide a *Kubernetes native* approach to managing the whole lifecyle of an application,
not just its deployment. For instance an operator can handle deploying a database as well as
managing procedures for backing it up and restoring it from backups.

A well written operator should be able to be deployed to vanilla Kubernetes or to OpenShift.

Operators can be defined in a number of ways, including HELM charts, Ansible playbooks and using a Go API.

## Examples

### PySimple

Describe the PySimple operator

---
[toc](../README.md) | [prev](../tutorial-5/README.md) | next