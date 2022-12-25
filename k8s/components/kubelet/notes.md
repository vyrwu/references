# kubelet

Kubernetes' first point of contact on the worker node. This component DOES NOT reside in the control plane, but is deployed as an agent across all worker nodes.

It registers the node, sends node/pod/container reports at regular intervals, and creates containers using the container runtime provided.

## Installation

WARNING: `KUBEADM` DOES NOT INSTALL KUBELET. IT MUST ALWAYS BE INSTALLED MANUALLY!

1. Dowload the binary, extract, and run as a service

## Config

`ps -aux | grep kubelet` on the worker node.
