variable "project_id" {
  description = "The ID of the project where resources will be created. Define via TF_VAR_project_id ou terraform.tfvars (não versionado)."
  type        = string
}
variable "region" {
  description = "The region where resources will be created."
  type        = string
  default     = "us-central1"
}
variable "zone" {
  description = "The zone where the Google Compute Engine instance will be created."
  type        = string
  default     = "us-central1-a"
}
variable "services" {
  description = "List of Google Cloud services to enable for the project."
  type        = list(string)
  default = [
    "compute.googleapis.com",
    "storage.googleapis.com",
    "cloudresourcemanager.googleapis.com"
  ]
}
variable "vpc_name" {
  description = "The name of the VPC network to create."
  type        = string
  default     = "tf-vpc-network"
}

variable "vm_assign_public_ip" {
  description = "Atribuir IP público à VM. Desabilitado por padrão por segurança (use apenas quando necessário)."
  type        = bool
  default     = false
}
