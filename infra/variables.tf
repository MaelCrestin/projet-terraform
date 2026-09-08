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
  description = "Prefixe unique, identique a celui utilise dans socle/."
  type        = string
  default     = "mc"
}

variable "environment" {
  description = "Environnement cible : dev, test ou prod."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "La variable environment doit valoir \"dev\", \"test\" ou \"prod\"."
  }
}

variable "machine_type" {
  description = "Gabarit des machines web."
  type        = string
  default     = "e2-small"
}

variable "machine_count" {
  description = "Nombre de machines web a deployer."
  type        = number
  default     = 2
}

locals {
  prefix = var.prefix

  common_labels = {
    prefix      = local.prefix
    environment = var.environment
  }
}
