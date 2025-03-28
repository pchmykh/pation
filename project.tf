resource "digitalocean_project" "test" {
  name        = "test"
  description = "Test Environment"
  purpose     = "Web Application"
  environment = "Development"
}
