#####
# Providers
#####

provider "random" {
  version = "~> 2"
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

#####
# default example
#####

module "this" {
  source = "../.."

  data_source_name = "fake"
}
