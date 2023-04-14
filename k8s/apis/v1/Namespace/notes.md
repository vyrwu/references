# Namespace

Logical separator of Kubernetes objects. Provide separated workspaces for operators.

> The default namespace in K8s is called `default`

```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: dev
```

## Commands

```bash
# Set current namespace as context
kubectl config set-context $(kubectl config current-context) --namespace=dev
```

```bash
# View pods in all namespaces
kubectl get pod --all-namespaces
```