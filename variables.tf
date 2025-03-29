variable "droplet_config" {
  type = object({
    image  = string
    name   = string
    region = string
    size   = string
  })
  default = {
    image  = "ubuntu-24-10-x64"
    name   = "droplet1"
    region = "fra1"
    size   = "s-1vcpu-512mb-10gb"
  }
}

variable "ssh_keys" {
  type    = list(string)
  default = ["pchmykh@mac", "pchmykh@fedora"]
}
