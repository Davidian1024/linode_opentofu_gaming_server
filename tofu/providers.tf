terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "2.22.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "2.3.4"
    }
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
  }
}

provider "linode" {
  # Configuration options
}
