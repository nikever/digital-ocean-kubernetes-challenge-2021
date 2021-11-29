resource "digitalocean_kubernetes_cluster" "kubernetes_challenge" {
  name   = "kubernetes-challenge"
  region = "ams3"

  version      = "1.21.5-do.0"
  auto_upgrade = false

  node_pool {
    name       = "autoscale-pool-01"
    size       = "s-1vcpu-2gb"
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 3

    labels = {
      app = "crossplane"
    }
  }
}
