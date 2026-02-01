variable "project_id" {
  description = "The ID of the project where resources will be created."
  type        = string
}
variable "region" {
  description = "The region where resources will be created."
  type        = string
}
variable "zone" {
  description = "The zone where the Google Compute Engine instance will be created."
  type        = string
}
# This variable is used to define the VPC network and subnetwork configurations.

variable "routing_mode" {
  description = "The routing mode for the VPC network (GLOBAL or REGIONAL)."
  type        = string

}
variable "subnets" {
  description = "List of subnets to create in the VPC."
  type = list(object({
    name          = string
    ip_cidr_range = string
  }))
  default = []
}
variable "vpc_name" {
  description = "The name of the VPC network."
  type        = string

}
variable "vpc_subnetwork_name" {
  description = "The name of the VPC subnetwork."
  type        = string
}
variable "private_ip_google_access" {
  description = "Enable private Google access for the subnetwork."
  type        = bool
  default     = true

}
