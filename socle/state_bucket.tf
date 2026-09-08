resource "google_storage_bucket" "tfstate" {
  name     = "${local.prefix}-tfstate-${var.project_id}"
  location = upper(var.region)
  project  = var.project_id

  storage_class               = "STANDARD"
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}
