# kube-proxy

Pods inside Kubernetes communicate with each other using a virtual network that spans all Kubernetes nodes. Each pod has it's own IP, however, IPs in K8s can change. Services are used to hide actual pod IP behind a  hostname assigned to a constant IP which doesn't change, and gets translated into the underlying Pod IP.

`kube-proxy` is deployed as Daemonset (pod on every node) which contains IPTABLES rules that fowrard virtual service IP traffic to the real pod IPs.

## Installation

1. Download for Kubernetes page, extract, run as a service.
2. Installed via `kubeadm` as Daemonset.
