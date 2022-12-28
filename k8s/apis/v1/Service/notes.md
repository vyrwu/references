# Service

Basic networking component, allows amongst other things to:
- hide transient pod IP and port behind a stable service name and port 
- enables load-balancing across pods
- provides an entrypoint for traffic to a pod/set of pods

## NodePort Service

Pick a port in the range between 30000-32767. Expose a NodePort service. All the nodes in the K8S cluster will serve the service (and backend pods) through that port.

> NodePort must be unique, otherwise services will clash.
