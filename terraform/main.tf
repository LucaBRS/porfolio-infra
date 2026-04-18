# Configurazione Terraform — backend e provider
terraform {
  backend "gcs" {
    bucket = "luca-portfolio"
    prefix = "tfstate"
  }

  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
  }
}

# Configura il provider Hetzner con il token
provider "hcloud" {
  token = var.hetzner_token
}

resource "hcloud_ssh_key" "portfolio" {
  name       = "portfolio-key"
  public_key = var.ssh_public_key
}

# # Carica la chiave SSH pubblica su Hetzner
# resource "hcloud_ssh_key" "portfolio" {
#   name       = "portfolio-key"
#   public_key = file("/root/.ssh/id_ed25519_hetzner.pub")
# }

# Crea il VPS
resource "hcloud_server" "portfolio" {
  name        = var.server_name
  image       = "ubuntu-24.04"
  server_type = "cx23"
  location    = var.location

  # Assegna la chiave SSH
  ssh_keys = [hcloud_ssh_key.portfolio.id]

  labels = {
    project = "portfolio"
  }
}