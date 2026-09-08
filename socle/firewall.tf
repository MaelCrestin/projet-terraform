resource "google_compute_firewall" "allow_iap_ssh" {
  name    = "${local.prefix}-fw-allow-iap-ssh"
  network = google_compute_network.main.id

  direction     = "INGRESS"
  source_ranges = ["35.235.240.0/20"]
  target_tags   = ["ssh"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "allow_web" {
  name    = "${local.prefix}-fw-allow-web"
  network = google_compute_network.main.id

  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web"]

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
}
