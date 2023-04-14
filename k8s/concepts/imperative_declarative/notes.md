# Imperative vs. Declarative

## Imperative

Use for speed.

```bash
# Create Pod
kubectl run --image=nginx nginx

# Create Deployment 
kubectl create deployment --image=nginx nginx

# Create Service
kubectl expose deployment nginx --port=80

# Edit
kubectl edit deployment nginx

# Scale deployment
kubectl scale deployment nginx --replicas=5

# Set Image
kubect set image deployment nginx nginx=nginx:1.18

# Create file
kubectl create -f nginx.yaml

# Replace file
kubectl replace -f nginx.yaml

# Delete file
kubectl delete -f nginx.yaml
```

# Declarative

Use for correctness and managing bigger tasks.

```bash
# Update state
kubectl apply -f nginx.yaml
```
