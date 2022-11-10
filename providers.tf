provider "aws" {
  region = var.region
}

provider "aws" {
  region = "eu-central-1"
  alias  = "frankfurt"
}

provider "aws" {
  region = "eu-west-1"
  alias  = "ireland"
}
