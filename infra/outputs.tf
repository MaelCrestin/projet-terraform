output "web_public_ips" {
  description = "Adresses IP publiques des machines web."
  value       = [for instance in google_compute_instance.web : instance.network_interface[0].access_config[0].nat_ip]
}

output "artifacts_bucket_name" {
  description = "Nom du bucket d'artefacts."
  value       = google_storage_bucket.artifacts.name
}

output "service_account_email" {
  description = "Adresse email du compte de service."
  value       = google_service_account.web.email
}
