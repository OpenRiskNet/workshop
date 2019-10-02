# Persistent storage

[toc](../README.md) | [prev](../exercise-b/README.md) | [next](../exercise-d/README.md)

Here we describe how to make your applications use persistent storage so that data remains between restarts. 

---

So far all our pods have been _ephemeral_, meaning that all data is stored in the container and is lost when the
container stops. For things like databases this is no good - we can't loose our data every time the container stops!

The solution to this is you use persitsent storage for your pods. This is in the form of **volumes** that can be thought
of as a disk that is mounted into your container at the required location. This allows the storage to be external to the pod.
When the pod stops the data remains. When a new pod is started that volume with its existing data is added to the pod and mounted
into the running container.

OpenShift provides a large number of mechanisms to provide this persistent storage, including NFS, local volumes and cloud
based storage (e.g. EBS volumes if running on AWS). See 
[here](https://docs.okd.io/latest/install_config/persistent_storage/index.html) for a complete list. Setting up persistent
storage for your OpenShift cluster is beyond the scope of this workshop. All we'll do is learn how to use persistent 
storage that has already been set up.

## Persistent Volumes and Persistent Volume Claims

At the heart of persistent storage is a **persistent volume** (PV), a bit of physical disk spaces somewhere provided by one
of the mechanisms mentioned above, and a **persistent volume claim** (PVC) a claim for some persistent storage that is
provided by a PV and can be used by a **pod**.
The PV is the physical storage, the PVC is what is used to bind the PV to a particular pod(s).

PVs are global in scope, but once bound by a PVC are restricted to the **project** where that PVC resides.
A PVC can have different **accessModes**, **ReadWriteOnce** (meaning the PVC can be used by only one pod and access is read-write), 
**ReadOnlyMany** (meaning the PVC can be used by multiple pods and access is read-only) and **ReadWriteMany**
(meaning the PVC can be used by multiple pods and access is read-write). 
Not all storage types support all modes.

Some storage types are _dynamic_ in that they can assign storage on the fly as its requested. Other types are _static_ in 
that the storage needs to be pre-allocated by creating the physical storage (e.g. a directory defined as an NFS export on
a NFS server) and then creating a PV that uses that export. Then you can create a PVC that can be used by a pod that 
utilises the PV for its storage.

A simple PVC definition looks like this:
```yaml
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: pysimple
spec:
  accessModes:
  - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
```

When creating a PVC you have a number of options:
* Use dynamic storage if it is available, optionally specifying a **StorageClass**, the required **accessMode** and size.
In this case the storage is dynamically created (e.g. using a cloud volume such as EBS).
* Rely on there being PVs available that can be claimed (or first create them yourself).
You specify the size of storage you need and the **accessMode** and Kubernetes will allocate
an existing PV to you. 
If more than one is available it will allocate the smallest one that satisfies your request.
The problem with this approach is that you do not aways get the PV that you might have expected.
And someone else might get the PV that you wanted before you get to claim it.
* To avoid the problem just described you can either create the PV with a definition of the PVC that is allowed to claim 
it, or create the PVC with a definition of the PV that it is to use, or both of these.  

Examples of setting up NFS and creating PVs and PVCs that use NFS can be found 
[here](https://github.com/OpenRiskNet/home/blob/master/openshift/recipes/creating-persistent-volumes-nfs.md).


In the next exercise will illustrate how to create a PVC that uses a NFS based PV. 
 

---
[toc](../README.md) | [prev](../exercise-b/README.md) | [next](../exercise-d/README.md)
