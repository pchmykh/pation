terraform {
  backend "s3" {
    bucket   = "your-project-tfstate"
    key      = "terraform.tfstate"
    region   = "us-east-1"  # Still required as dummy value
    
    endpoints = {
      s3 = "https://fra1.digitaloceanspaces.com"
    }
    
    skip_credentials_validation = true
    skip_region_validation      = true
    use_path_style            = true
  }
}
