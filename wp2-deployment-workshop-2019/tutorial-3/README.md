# Persistent storage

[toc](../README.md) | [prev](../exercise-b/README.md) | [next](../exercise-d/README.md)

Here we describe how to make your applications use persistent storage so that data reamins bwtween restarts. 

---

So far all our pods have been _ephemeral_, meaning that all data is stored in the container and is lost when the
container stops. For things like databases this is no good. We can't loose our data every time the container stops!

The solution to this is you use perssitent storage for your pods. This is in the form of **volumes** that can be thought
of as a disk that is mounted into your container at the required location. This allows the storage to be exteranal to the pod.
When the pod stops the data remains. When a new pod is started that volume with its existing data is added to the pod and mounted
into the running container.

OpenShift provides a large number of mechanisms to provide this persistent storage, including NFS, local volumes. See 
[here](https://docs.okd.io/latest/install_config/persistent_storage/index.html) for a complete list. Setting up persistent
storage for your OpenShift cluster is beyond the scope of this workshop. All we'll do is learn how to use persistent 
storage that has already been set up.

## Persistent Volumes and Persistent Volume Claims

At the heart of perstsitent storage is a **persistent volume** (PV), a bit of physical disk spaces somewhere provided by one
of the mechanisms mentioned above, and a **persistent volume claim** (PVC) a claim for a particular PV that can be used by a 
**pod**. The PV is the physical storage, the PVC is what is used to bind the PV to a particular pod(s).

PVs are global in scope, but once bound by a PVC are restricted to the project where that PVC resides.
A PVC can have different access types, ReadWriteOnce (meaning the PVC can be used by only one pod and access is read-write), 
ReadOnlyMany (meaning the PVC can be used by multiple pods and access is read-only) and ReadWriteMany (meaning the PVC can be 
used by multiple pods and access is read-write). Not all storage types support all modes.

Some strorage types are _dynamic_ in that they can assign storage on the fly as its requested. Other types are _static_ in 
that the storage needs to be pre-allocated.
 

---
[toc](../README.md) | [prev](../exercise-b/README.md) | [next](../exercise-d/README.md)
