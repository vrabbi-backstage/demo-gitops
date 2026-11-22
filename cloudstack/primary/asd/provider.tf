terraform {
  required_providers {
    cloudstack = {
      source  = "cloudstack/cloudstack"
      version = "0.7.0"
    }
  }
}

# Credentials come from CLOUDSTACK_API_URL, CLOUDSTACK_API_KEY and CLOUDSTACK_SECRET_KEY.
provider "cloudstack" {
}
