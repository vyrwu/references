# Deployment

Object that encapsulates `ReplicaSet`, but additionally provides capabilities to make rolling updates to the underlying pods and their configurations. It allows to execute rolling updates on Pods.

Deployment creates a `ReplicaSet`, which in turn creates `Pods`.

## Commands

```bash
 # see all created resources
 kubectl get all
```
```bash
 # create a Deployment template
 kubectl create deployment --image=nginx --replicas=4 nginx --dry-run=client -oyaml > deployment.yaml
```
