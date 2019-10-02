# Probes and Limits

[toc](../README.md) | [prev](../tutorial-4/README.md) | [next](../tutorial-6/README.md)

Here we describe how to specify probes that can monitor your application's status and
how to control memory and CPU usage.

---

## Probes

As part of your pod specification (typically defined in a **Deployment Config**) you are recommended to provide 
**liveness** and **readiness** probes. These are defined in detail in the
[OpenShift](https://docs.okd.io/latest/dev_guide/application_health.html) and 
[Kubernetes](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/)
documentation.

A **readiness probe** allows Kubernetes to determine if your pod is ready to accept requests (e.g. has started up 
correctly).

A **liveness probe** allows Kubernetes to determine if your pod is still running. If it is not then it can try to
restart it.

Note: Kubernetes now also supports a **startup probe** which looks to be useful.

These probes are typically simple `ping` like endpoints that you implement in your container to provide a simple diagnostic
that your pod is alive or ready. For example, **PySimple** is a simple HTTP server so a suitable probe would be to check
that the pod is respond to HTTP requests. The relevant section from the **Deployment Config** template looks like this:

```
          readinessProbe:
            tcpSocket:
              port: 8080
            initialDelaySeconds: 5
            periodSeconds: 5
          livenessProbe:
            tcpSocket:
              port: 8080
            initialDelaySeconds: 3
            periodSeconds: 3
``` 

Here we use the same endpoint for the **liveness** and **readiness** probes, but in other cases you might want to use
different mechanisms for each.

We specify that the probes use a `tcpSocket` on port 8080 and specify an initial delay before probing starts, and an
interval at which probing occurs. For the **readiness** check probing will continue until the probes passes its check.
For the **liveness** check the probe will run continually to check if the container is still running. Parameters for
timeouts and number of failures etc. can also be specified if the defaults need changing.

See the full documentation listed above for a full description of the different types of probes
that can be used.

Defining **liveness** and **readiness** probes for your applications is strongly recommended. 
Doing so often requires a bit of tinkering with the parameters. If they are too stringent then Kubernetes
will continually kill and restart the pod before it has a chance to start.


## Resource Requests and limits

When Kubernetes schedules a pod to run it trying to schedule it on a node that has sufficient memory and CPU for that
pod. To help with this you can define resource **requests** and **limits** for your container. These define the amount
if memory and CPU that you pod needs. These are described in detail
[here](https://docs.okd.io/latest/dev_guide/compute_resources.html#dev-compute-resources),
[here](https://kubernetes.io/docs/tasks/configure-pod-container/assign-cpu-resource/) and
[here](https://kubernetes.io/docs/tasks/configure-pod-container/assign-memory-resource/)

The **request** is the amount of memory and CPU that needs to be set aside for your container. Kubernetes will schedule
your pod to a node that has that amount of memory available. 

The **limit** is the maximum amount or memory or CPU that is allowed to be consumed. **Limits** are higher than
**requests** so that, for instance you can state that your container will typically require 0.5 CPU cores, but on
occasions it might need 4 CPU cores.

As an example here is how are defined for the **PySimple** application:
```
          resources:
            limits:
              cpu: 1000m
              memory: 32Mi
            requests:
              cpu: 100m
              memory: 8Mi
```

CPU resources are specified in milli cpu cores so `1000m` is 1 CPU core.
Memory resource are specified in Megabytes so the request is for 8MB RAM.
Specifying these values in other units is also possible.

The way memory and CPU resources are handled is different. CPU is *elastic* in nature. There is no real harm in 
oversubscribing the CPU allocation, things will just run slower than expected. In the case of excess CPU Kuberenetes
will restrict containers (using Linux CGroups) that are using more than their **resource limit** and give preference
to containers that are within their limit.

Memory in contrast is not *elastic*. Each server had a fixed amount and you can't use more than that. In the case of a
container using more than its specified **resource limit** the pod will be killed and restarted. This can be useful,
for instance in the case of an application that has a slow memory leak. Memory usage will continually increase until
the **resource limit** is reached at which point the pod will be killed and restarted.

Determining the correct settings for resource **requests** and **limits** can be tricky. If you don't set them then on
under-utilised environments then little harm will be done - just that the Kubernetes scheduler will not be able to 
optimise deployment. On a heavily utilised environment this can be more problematical. Thus setting **requests** and 
**limits** is generally a good idea, but setting inappropriate values is like to do more harm than not setting them at
all.

Our general recommendation is:

1. First run your application without resource **requests** and **limits** and monitor its memory and CPU usage over
time to get an idea of what might be appropriate.
1. Then define generous resource **requests** and **limits** that you are confident are in excess of what is really
needed.
1. Then continue to monitor usage and gradually reduce the resource **requests** and **limits** to values that seem to be
correct. 

---
[toc](../README.md) | [prev](../tutorial-4/README.md) | [next](../tutorial-6/README.md)
