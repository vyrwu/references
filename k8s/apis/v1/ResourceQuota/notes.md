# ResourceQuota

Sets a limit of resources assignable to a certain namespace.

```yaml
apiVersion: v1
kind: ResourceQuota
metadata:
  name: rq-test
  namespace: dev
spec:
    hard:
        pods: "10"
        requests.cpu: "4"
        requests.memory: 5Gi
        limits.cpu: "10"
        limits.memory: 10Gi
```
