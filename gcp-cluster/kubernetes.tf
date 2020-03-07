resource "google_container_cluster" "test_cluster" {
  name     = "${var.cluster_name}"
  location = "${var.region}"

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true

  master_auth {
    username = "${var.node_username}"
    password = "${var.node_password}"
  }

  node_pool {
    name = "default-pool"
  }

}

resource "google_container_node_pool" "node_pool" {
  name       = "test-node-pool"
  location   = "${google_container_cluster.test_cluster.location}"
  cluster    = "${var.cluster_name}"
  node_count = 2

  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
