# Elastic Kubernetes Service

Managed Kubernetes clusters on AWS.

## Ephemeral Volumes

Volumes attached to Pods that are not backed by persisted remote volume.

Used to store operational data, or data that has to be accessed frequently
at low latency.

There are multiple types of ephemeral volumes:

- `emptyDir`: empty at startup, backed by kubelet base dir (root), or RAM
- `configMap`, `downwardAPI`, `secret`: K8s data into pods
- `CSI ephemeral vol.`: provided by specific CSI drivers
- `generic emphemeral vol.`: provided by persistent volumes storage drivers



