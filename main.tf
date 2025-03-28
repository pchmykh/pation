terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Values was added to *.tfvars file
variable "do_token" {}
variable "pvt_key" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "keys" {
  for_each = toset(var.ssh_keys)
  name     = each.key
}

# ssh keys befor moving to vars file
#data "digitalocean_ssh_key" "terraform1" {
#  name = "pchmykh@mac"
#}
#
#data "digitalocean_ssh_key" "terraform2" {
#  name = "pchmykh@fedora"
#}
