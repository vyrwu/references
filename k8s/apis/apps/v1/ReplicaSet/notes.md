# ReplicaSet

Controller that maintains the desired number of pods running at all times in the cluster.

It creates pods across nodes as desired, and it can help scale the application by deploying more pods once the demand increases.

It can also adopt existing pods using `selector`.

## Commands

```bash
# Scale up via file
kubectl scale --replicas=6 -f replicaset.yaml
```

```bash
# Scale up via api
kubectl scale --replicas=6 replicaset myapp-rs
```

```bash
# Delete replicaset AND ALL PODS
kubectl delete replicaset myapp-rs
```


