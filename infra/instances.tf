resource "google_compute_instance" "web" {
  count = var.machine_count

  name         = "${local.prefix}-web-${count.index + 1}"
  machine_type = var.machine_type
  zone         = "${var.region}-b"
  tags         = ["web", "ssh"]
  labels       = local.common_labels

  boot_disk {
    initialize_params {
      image = data.google_compute_image.debian.self_link
    }
  }

  network_interface {
    subnetwork = data.google_compute_subnetwork.web.self_link

    access_config {}
  }

  service_account {
    email  = google_service_account.web.email
    scopes = ["cloud-platform"]
  }

  metadata_startup_script = templatefile("${path.module}/startup.sh.tpl", {
    instance_name = "${local.prefix}-web-${count.index + 1}"
  })
}
