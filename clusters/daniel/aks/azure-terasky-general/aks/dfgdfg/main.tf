# Spectro Cloud Cluster - dfgdfg
# Generated from Backstage Cluster Deployment Wizard
# Reference: https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/aks

data "spectrocloud_cloudaccount_azure" "account" {
  name = "azure-terasky-general"
}

data "spectrocloud_cluster_profile" "profile_0" {
  name    = "daniel-aks"
  version = "1.0.0"
  context = "project"
}

resource "spectrocloud_cluster_aks" "cluster" {
  name             = "dfgdfg"
  cloud_account_id = data.spectrocloud_cloudaccount_azure.account.id
  skip_completion  = true

  cluster_profile {
    id = data.spectrocloud_cluster_profile.profile_0.id
  }

  cloud_config {
    subscription_id = "3cf9275b-a963-43d6-bfa7-c14a4ab04bfa"
    region          = "eastus"
    resource_group  = "rg-vault-lab-unseal-ivan"
    ssh_key         = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC4WyexTrHlHayExsx5sv6D/9LV+EsKzK0rekJowoFAk00LGZBCtf5+KMcRN1sVyJNfXZ68uuZCp/FHzjTl9yq4ViZaYNv4MjM4rEtpPfV7nrJeCJnGLZZNhBC5iQ5rnDSIW0ReC5vMERU71twAOHFiA019MSD9LfJE6LA/nmTc7zmYBBLtWuKAPbQBeJNM8UweNvXf6tvH82tkBO/emh4HaaaOyrypPOq8SdAD485I1/5m2dhFX52kUIn6R99AzYXE4sUbqd4wa4lKfQNhxeLYVry7bP/A1jAUWft66GhReKcNox9epyhGCm/icAHcjCCbmMOu0cINeZMPF4BvUQ/q+1j+wGqviNwbOa4Rr2VeO64xFi/ChwPLjajiHdOssBnwXzsXkBRYpWYH/gPLD3Y6W4wrjU958oQcMo2LtJ1pB7MIO9X30mDX0Qn/yTRFHqJ3Tm6ZAN+2pEXWISEEGGg1j6QRZ2TZQKL7rDD1nDQSqU7nH46KsaZ01Y4LU9SXZmk= k8s@tce-admin-vm"
    authorized_ip_ranges = ["0.0.0.0/0"]
  }

  machine_pool {
    name                 = "system-pool"
    count                = 1
    instance_type        = "Standard_A8m_v2"
    disk_size_gb         = 60
    storage_account_type = "Premium_LRS"
    is_system_node_pool  = true
  }
}