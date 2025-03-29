# creating droplet
resource "digitalocean_droplet" "droplet1" {
  image    = var.droplet_config.image
  name     = var.droplet_config.name
  region   = var.droplet_config.region
  size     = var.droplet_config.size
  ssh_keys = [for key in var.ssh_keys : data.digitalocean_ssh_key.keys[key].id]
  # before moving ssh keys to var file
  #    data.digitalocean_ssh_key.terraform1.id,
  #    data.digitalocean_ssh_key.terraform2.id
  #]

  # SSH connection data for later provisioning
  connection {
    host        = self.ipv4_address
    user        = "root"
    type        = "ssh"
# Commented next line due to ssh agent implementation
#    private_key = file(var.pvt_key)
    timeout     = "2m"
  }
}

# move droplet to 'test' project after project creating
resource "digitalocean_project_resources" "project_test_assigment" {
  depends_on = [digitalocean_project.test, digitalocean_droplet.droplet1]
  project    = digitalocean_project.test.id
  resources  = [digitalocean_droplet.droplet1.urn]
}

# create droplet description file
resource "local_file" "droplet_info" {
  filename = "${digitalocean_droplet.droplet1.name}_info.txt"
  content  = <<-EOT
Name: ${digitalocean_droplet.droplet1.name}
IP: ${digitalocean_droplet.droplet1.ipv4_address}
Region: ${digitalocean_droplet.droplet1.region}
Size: ${digitalocean_droplet.droplet1.size}
Created: ${timestamp()}
EOT
}
