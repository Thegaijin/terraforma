# // General Variables

variable "node_username" {
  type        = "string"
  description = "Username for the nodes in the cluster."
}

variable "node_password" {
  type        = "string"
  description = "Password for the nodes in the cluster"
}

// GCP Variables
variable "node_count" {
  type        = "string"
  description = "Initial number of nodes in cluster."
}

variable "cluster_name" {
  type        = "string"
  description = "Name for the Cluster."
}

variable "region" {
  type        = "string"
  description = "Region cluster is in."
}

// GCP Outputs
output "cluster_endpoint" {
  value = "${google_container_cluster.test_cluster.endpoint}"
}

output "ssh_command" {
  value = "ssh ${var.node_username}@${google_container_cluster.test_cluster.endpoint}"
}

output "cluster_name" {
  value = "${google_container_cluster.test_cluster.name}"
}
