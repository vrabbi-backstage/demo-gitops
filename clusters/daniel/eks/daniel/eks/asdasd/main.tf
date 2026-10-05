# Spectro Cloud Cluster - asdasd
# Generated from Backstage Cluster Deployment Wizard
# Reference: https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/eks

data "spectrocloud_cloudaccount_aws" "account" {
  name = "daniel"
}

data "spectrocloud_cluster_profile" "profile_0" {
  name    = "daniel-eks"
  version = "1.0.0"
  context = "project"
}

resource "spectrocloud_cluster_eks" "cluster" {
  name             = "asdasd"
  cloud_account_id = data.spectrocloud_cloudaccount_aws.account.id
  skip_completion  = true

  cluster_profile {
    id = data.spectrocloud_cluster_profile.profile_0.id
  }

  cloud_config {
    region          = "eu-west-1"
    endpoint_access = "private_and_public"
    public_access_cidrs = ["0.0.0.0/0"]
    private_access_cidrs = ["0.0.0.0/0"]
    ssh_keypair_name = "daniel-wsl"
  }

  machine_pool {
    name          = "control-plane-pool"
    control_plane = true
  }

  machine_pool {
    name          = "worker-pool-1"
    instance_type = "c4.xlarge"
    disk_size_gb  = 60
    count         = 1
    min           = 1
    max           = 3
  }
}