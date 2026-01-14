variable "credentials" {
  description = "my credentials"
  default     = "./keys/creds.json"
}

variable "location" {
  description = "project location"
  default     = "US"
}

variable "bq_dataset_name" {
  description = "my bigquery dataset name"
  default     = "demo_dataset"
}

variable "gcs_bucket_name" {
  description = "my storage bucket name"
  default     = "inspired-photon-483901-k9-terra-bucket"
}

variable "gcs_storage_class" {
  description = "bucket storage class"
  default     = "STANDARD"
}
