resource "digitalocean_droplet" "droplet1" {
  image = "ubuntu-24-10-x64"
  name = "www-1"
  region = "fra1"
  size = "s-1vcpu-512mb-10gb"
  ssh_keys = [
    data.digitalocean_ssh_key.terraform1.id,
    data.digitalocean_ssh_key.terraform2.id
  ]
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }
  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      # install nginx
      "sudo apt-get update",
      "sudo apt-get -y install nginx"
    ]
  }
}
