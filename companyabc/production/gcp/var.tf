

variable "project_id" {
  description = "The ID of the project where this VPC will be created"
  type        = string
  default     = "uaedataloop"
}

variable "network_name" {
  description = "The name of the network being created"
  type        = string
  default     = "uaedataloop-vpc"
}

variable "routing_mode" {
  type    = string
  default = "REGIONAL"
}

variable "auto_create_subnetworks" {
  type    = bool
  default = true
}

variable "machine_type" {
  default = "e2-standard-4"
}

variable "location" {
  default = "asia-south2"
}

variable "node_disk_size" {
  default = "30"
}

variable "cluster_name" {
  type    = string
  default = "uaedataloop-gke-cluster"
}

variable "subnetwork" {
  default = "10.142.0.0/20"
}

variable "zone" {
  default = "asia-south2-a"
}
