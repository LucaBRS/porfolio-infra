# Token API Hetzner — passato dal tf-ansible.env
variable "hetzner_token" {
  description = "Hetzner Cloud API token"
  type        = string
  sensitive   = true
  default     = null
}

# Nome del server
variable "server_name" {
  description = "Nome del VPS su Hetzner"
  type        = string
  default     = "portfolio-vps"
}

# Location del datacenter
variable "location" {
  description = "Hetzner datacenter location"
  type        = string
  default     = "nbg1" # Nuremberg
}

variable "ssh_public_key" {
  description = "SSH public key content"
  type        = string
  sensitive   = false
}