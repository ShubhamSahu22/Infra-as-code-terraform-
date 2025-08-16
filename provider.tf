provider "aws" {
  region = var.region
}

# Example: deploy in second region (optional)
provider "aws" {
  alias  = "secondary"
  region = var.secondary_region
}
