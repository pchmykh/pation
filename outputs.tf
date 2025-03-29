## output for droplet1.tf file
#output "droplet_id" {
#  value = digitalocean_droplet.droplet1.id
#}

# output for project.tf file
output "project_id" {
  value = digitalocean_project.test.id
}

# output for droplet1.tf file
output "droplet_ip_address" {
  description = "Public IPv4 address of the droplet"
  value       = digitalocean_droplet.droplet1.ipv4_address
}


