# Apiserver

Primary management component in Kubernetes. Serves data from `etcd`, and is being watched by multiple Kubernetes control plane components to allow efficient container orchestration.

Is responsible for authentication and authorization of users.

Is watched by `scheduler`, to know when a pod needs to be scheduled, and communicates to `apiserver` which node it should choose. `apiserver` then Communicates with `kubelet` on a worker nodes to schedule a pod.

All operartions performed by `apiserver` are persisted in `etcd`.

## KUBECTL

Commandline interface for interacting with `apiserver`. It also provides simplified means of authentication and cluster context management, but really simply wraps HTTP api calls.

## Installation
1. `kubeadm` tool
2. Download and run as binary. 