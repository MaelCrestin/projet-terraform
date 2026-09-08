data "google_compute_subnetwork" "web" {
  name    = "${local.prefix}-subnet-web"
  region  = var.region
  project = var.project_id
}

data "google_compute_image" "debian" {
  family  = "debian-12"
  project = "debian-cloud"
}
