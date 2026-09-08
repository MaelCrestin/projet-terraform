resource "google_service_account" "web" {
  account_id   = "${local.prefix}-web-sa"
  display_name = "Compte de service des machines web (${local.prefix})"
}
