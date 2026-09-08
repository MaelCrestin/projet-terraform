variable "project_id" {
  description = "Identifiant du projet Google Cloud de formation."
  type        = string
}

variable "region" {
  description = "Region Google Cloud utilisee pour toutes les ressources."
  type        = string
  default     = "europe-west1"
}

variable "prefix" {
  description = "Prefixe unique (initiales) pour toutes les ressources."
  type        = string
  default     = "mc"
}

locals {
  prefix = var.prefix
}
