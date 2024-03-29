variable cloud_id {
  description = "Cloud"
}
variable folder_id {
  description = "Folder"
}
variable zone {
  description = "Zone"
  type        = string
  default     = "ru-central1-a"
}
variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable private_key_path {
  description = "Path to private key for provisioner access"
}
variable subnet_id {
  description = "Subnet"
}
variable service_account_key_file {
  description = "key.json"
}
variable counts {
  description = "instance count"
}
variable gitlab_image_id {
  description = "gitlab-ci base image:"
}
