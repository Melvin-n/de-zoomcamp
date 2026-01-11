terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.15.0"
    }
  }
}

provider "google" {
  project = "inspired-photon-483901-k9"
  region  = "australia-southeast1"
}

resource "google_storage_bucket" "demo-bucket" {
  name          = "inspired-photon-483901-k9-terra-bucket"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}
