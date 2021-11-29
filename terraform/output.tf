output "kubeconfig" {
  value       = digitalocean_kubernetes_cluster.kubernetes_challenge.kube_config.0.raw_config
  sensitive   = true
  description = "Kubeconfig of the kubernetes cluster"
}

output "cluster_ip" {
  value       = digitalocean_kubernetes_cluster.kubernetes_challenge.endpoint
  description = "Public IP of the cluster"
}
