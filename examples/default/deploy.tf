#####
# Providers
#####

provider "random" {
  version = "~> 2"
}

provider "kubernetes" {
  version          = "1.10.0"
  load_config_file = true
}

#####
# default example
#####

module "this" {
  source = "../.."

  data_source_name = "fake"
}
