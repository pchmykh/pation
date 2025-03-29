terraform {
  backend "s3" {
    bucket                      = "your-project-tfstate"
    key                         = "terraform.tfstate"
    region                      = "us-east-1" # Dummy value
    endpoint                    = "https://fra1.digitaloceanspaces.com"
    skip_credentials_validation = true
    skip_region_validation      = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    use_path_style              = true
  }
}
