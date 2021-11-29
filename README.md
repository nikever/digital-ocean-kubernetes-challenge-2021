# digital-ocean-kubernetes-challenge-2021

DigitalOcean Kubernetes Challenge

## 0. Prerequisites

Tool version used:

```bash
terraform 1.0.11
doctl 1.67.0
helm v3.6.3
```

## 1. Setup Kubernetes cluster

1. Create a Digital Ocean Token via the [UI](https://cloud.digitalocean.com/account/api/)

2. Export it to the `DIGITALOCEAN_TOKEN` environment variable

```bash
export DIGITALOCEAN_TOKEN=...
```

3. Setup Kubernetes Cluster with Terraform

```bash
cd terraform
make init
make plan
make apply
```

4. Get kubeconfig

```bash
make output
```

5. Use the kubeconfig

```bash
export KUBECONFIG=/path/to/this/repo/secrets/kubeconfig
```

6. Interact with the cluster

```bash
kubectl get nodes
```

Expected output:

```bash
NAME                      STATUS   ROLES    AGE   VERSION
autoscale-pool-01-ur0a0   Ready    <none>   14m   v1.21.5
```

## 2. Install Crossplane

> From <https://crossplane.io/docs/v1.5/getting-started/install-configure.html>

1. Use Helm 3 to install the latest official stable release of Crossplane, suitable for community use and testing:

```bash
kubectl create namespace crossplane-system

helm repo add crossplane-stable https://charts.crossplane.io/stable
helm repo update

helm install crossplane --namespace crossplane-system crossplane-stable/crossplane
```

2. Check Crossplane Status

```bash
helm list -n crossplane-system

kubectl get all -n crossplane-system
```

3. Install Crossplane CLI:

```bash
curl -sL https://raw.githubusercontent.com/crossplane/crossplane/release-1.5/install.sh | sh
```

4. Test that everything is working:

```bash
kubectl crossplane --help
```

## 3. Destroy Kubernetes cluster

1. Destroy cluster via Terraform

```bash
cd terraform
make destroy
```

2. Remove kubeconfig:

```bash
rm $KUBECONFIG
```

## Doctl cheat sheet

Get a list of Kubernetes regions:

```bash
doctl kubernetes options regions
```

Grab the latest version slug:

```bash
doctl kubernetes options versions
```
