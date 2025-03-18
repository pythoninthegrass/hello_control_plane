terraform {
  required_providers {
    cpln = {
      source = "controlplane-com/cpln"
    }
  }
}

provider "cpln" {
  org = var.org

  # Optional
  # Can use CPLN_PROFILE Environment Variable
  profile = var.profile

  # Optional
  # Can use CPLN_TOKEN Environment Variable
  token = var.token

  # Optional
  # Can use CPLN_REFRESH_TOKEN Environment Variable
  # refresh_token = var.refresh_token
}
