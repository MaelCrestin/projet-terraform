resource "google_storage_bucket" "artifacts" {
  name     = "${local.prefix}-artifacts-${var.project_id}"
  location = upper(var.region)
  project  = var.project_id

  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
  labels                      = local.common_labels

  versioning {
    enabled = true
  }
}
