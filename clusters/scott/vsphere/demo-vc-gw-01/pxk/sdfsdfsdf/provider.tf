terraform {
  required_providers {
    spectrocloud = {
      source  = "spectrocloud/spectrocloud"
      version = "0.28.3"
    }
  }
}
provider "spectrocloud" {
}
