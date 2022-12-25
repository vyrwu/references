# controller-manager

Manages various controllers in Kubernetes that work to bring the system to the desired state. Controller watches over certain resource in Kubernetes, and ensures their actual state matched the desired state (the desired state is served to controllers through `apiserver` and is stored in `etcd`.)

`controller-manager` comes with a lot of controllers which collectively act as a brain behind Kubernetes operations. 

## node-controller

Manages worker nodes in Kubernetes, including health-checks. Behaviour of this controller is configurable. When node stops responding with a health-check, the node-controller will cordon and drain the node, and reschedule all it's pod on other, healthy nodes.
 
## replication-controller

Manages pods according to associated replication sets. It keeps track of healhy pods, and should they die, it will deploy new ones.

## Installation

1. Install via binary provided from Kubernetes page. 

## Configuration options

`--controllers` - list of controllers to install. Default: `[*]`
`--node-monitor-period` - time interval at which to pool for node health. Default: `5s`
`--node-monitor-grace-period` - time interval after which an unhealthy node will be marked as unreachable.Default: `40s`
`--pod-eviction-timeout` - time interval after which node will unreachable node will be drained. Default: `5m`
