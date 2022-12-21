# Cluster Architecture

## Master Node
Manages, Plans, Schedules, Monitors Nodes and Containers on them.

Achieves that via **control plane components**:

### ETCD
Highly available key-value database storing information about containers running on the nodes. 

### Kube-scheduler
Schedules containers on the nodes, based on container resource requirements, node capacity, or other policies and constraints such as node tains and tolerations or node affinity rules etc. 

### Controller Manager

### Node-controller
Takes care of the node events, such as unhealthines or destroyment.

### Replication-controller
Takes care of ensuring the desired amount of replicas are running in the cluster. 

### API Server
Orchestrates all operations within the cluster. Exposes Kubernetes API to external users to perform management operations, for various controllers to perform operations as required, and for the nodes to communicate with the control plane. 

## Worker Node
Host applications as containers.

### Kubelet
Agent that runs on each worker node in the cluster. Listens to commands from the API Server and deploys or destroys the containers as required. API Server periodically fetches node and container info from the kubelet. 

### Kube-proxy
Agent that runs on each worker node, which ensured that containers hosted in different nodes can communicate with each other. It contains the communication rules that allow pods to talk to each other.
 