# ETCD

Highly available key-value database that stores all the information about the Kubernetes cluster,
including all registered API resources and, in general, all information that Kubernetes cluster
requires. This is the brain of Kubernetes - all k8s manifests applied land there.

## `etcdctl`

Command-line interface for interacting with ETCD

Version of `etcdctl` is controlled via env var `ETCDCTL=2/3`

### `ETCDCTL_API=2 etcdctl` COMMANDS

```bash
etcdctl backup
etcdctl cluster-health
etcdctl mk
etcdctl mkdir
etcdctl set
```

### `ETCDCTL_API=3 etcdctl` COMMANDS

```bash
etcdctl snapshot save
etcdctl endpoint health
etcdctl get
etcdctl put
```

## TLS

```bash
kubectl exec etcd-controlplane -n kube-system -- sh -c "ETCDCTL_API=3 etcdctl get / --prefix --keys-only --limit=10 --cacert /etc/kubernetes/pki/etcd/ca.crt --cert /etc/kubernetes/pki/etcd/server.crt --key /etc/kubernetes/pki/etcd/server.key"
```

## Installation
1. `kubeadm` tool
2. Bash:
```bash
ETCD_VER=v3.4.23

# choose either URL
GOOGLE_URL=https://storage.googleapis.com/etcd
GITHUB_URL=https://github.com/etcd-io/etcd/releases/download
DOWNLOAD_URL=${GOOGLE_URL}

rm -f /tmp/etcd-${ETCD_VER}-darwin-amd64.zip
rm -rf /tmp/etcd-download-test && mkdir -p /tmp/etcd-download-test

curl -L ${DOWNLOAD_URL}/${ETCD_VER}/etcd-${ETCD_VER}-darwin-amd64.zip -o /tmp/etcd-${ETCD_VER}-darwin-amd64.zip
unzip /tmp/etcd-${ETCD_VER}-darwin-amd64.zip -d /tmp && rm -f /tmp/etcd-${ETCD_VER}-darwin-amd64.zip
mv /tmp/etcd-${ETCD_VER}-darwin-amd64/* /tmp/etcd-download-test && rm -rf mv /tmp/etcd-${ETCD_VER}-darwin-amd64

/tmp/etcd-download-test/etcd --version
/tmp/etcd-download-test/etcdctl version
```