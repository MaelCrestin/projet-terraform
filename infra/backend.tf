terraform {
  backend "gcs" {
    bucket = "mc-tfstate-single-portal-506523-n0"
    prefix = "infra/dev"
  }
}
