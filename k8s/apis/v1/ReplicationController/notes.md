# Replication Controller

> **IMPORTANT**
> `v1/ReplicationController` has been replaced with `apps/v1/ReplicationSet`.

Controller that maintains the desired number of pods running at all times in the cluster.

It creates pods across nodes as desired, and it can help scale the application by deploying more pods once the demand increases.

