provider "google" {
  credentials = "${file("../../secrets/total-account.json")}"
  project     = "dependable-flag-258114"
  region      = "europe-west1"
}
