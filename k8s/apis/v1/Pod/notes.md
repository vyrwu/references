# Pods

Smallest object encapsulating containers running on worker nodes in Kubernetes.

## Multi-container Pods

Sidecars. They share the local network and local storage.

## Commands

### Run `nginx` container in a pod called `nginx`
```bash
kubectl run nginx --image nginx
```
