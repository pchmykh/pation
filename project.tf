# Creating "test" project to move droplet to after creation
resource "digitalocean_project" "test" {
  name        = "test"
  description = "Test Environment"
  purpose     = "Web Application"
  environment = "Development"
}
