# Spectro Cloud Cluster - sdfsdfsdf
# Generated from Backstage Cluster Deployment Wizard
# Reference: https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/vsphere

data "spectrocloud_cloudaccount_vsphere" "account" {
  name = "demo-vc-gw-01"
}

data "spectrocloud_private_cloud_gateway" "pcg" {
  name = "demo-pcg-01"
}

data "spectrocloud_ssh_key" "ssh_key" {
  name    = "tce"
  context = "tenant"
}

data "spectrocloud_cluster_profile" "profile_0" {
  name    = "shlomi-vsphere-cillium-full"
  version = "1.0.2"
  context = "tenant"
}
data "spectrocloud_cluster_profile" "profile_1" {
  name    = "headlamp"
  version = "1.0.0"
  context = "project"
}

resource "spectrocloud_cluster_vsphere" "cluster" {
  name             = "sdfsdfsdf"
  cloud_account_id = data.spectrocloud_cloudaccount_vsphere.account.id

  cloud_config {
    datacenter            = "Demo-Datacenter"
    folder                = "LABS/Scott/demo-vc-gw-01"
    image_template_folder = "spectro-templates"
    ssh_keys = [
      data.spectrocloud_ssh_key.ssh_key.id,
    ]
  }

  cluster_profile {
    id = data.spectrocloud_cluster_profile.profile_0.id

    variables = {
      "metallb_ip_range" = "10.2.2.1-10.2.2.10"
      "ingress_domain" = "a.b.c"
      "grafana_admin_password" = "VMware1!"
    }
  }

  cluster_profile {
    id = data.spectrocloud_cluster_profile.profile_1.id
  }

  machine_pool {
    name                    = "control-plane-pool"
    control_plane           = true
    control_plane_as_worker = false
    count                   = 1

    instance_type {
      disk_size_gb = 60
      memory_mb    = 8192
      cpu          = 4
    }

    placement {
      cluster       = "Demo-Cluster"
      resource_pool = "Default"
      datastore     = "Pure-VMFS-DEMO-03"
      network       = "/infra/segments/clarivate-tkg-vips"
    }

  }

  machine_pool {
    name = "worker-pool-1"

    count = 1
    min   = 1
    max   = 10

    skip_k8s_upgrade = "disabled"

    instance_type {
      disk_size_gb = 60
      memory_mb    = 8192
      cpu          = 10
    }

    placement {
      cluster       = "Demo-Cluster"
      resource_pool = "Default"
      datastore     = "Pure-VMFS-DEMO-03"
      network       = "/infra/segments/clarivate-tkg-vips"
    }

  }

}