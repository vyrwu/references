# Scheduler

Control plane component responsible for scheduling pods on nodes. It uses a node ranking system to determin the best container placement amongst available nodes. This ranking takes into account:
- filter: only nodes that can accomodate pods' resource requirements are selected
- rank: nodes that will be left with the most resources after scheduling are prioritised

## Installation

1. as pod installed in `kube-system` namespace via `kubeadm`
2. as service running directly on the master node, downloaded from the Kubernetes documentation

## Config


If installed via `kubeadm`: `cat /etc/kubernetes/manifests/kube-scheduler.yaml` on the master node.

If installed as a service: `ps -aux | grep kube-scheduler`
