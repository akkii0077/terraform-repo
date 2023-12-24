

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
  type    = string
  default = "e2-standard-4"
}

variable "location" {
  type    = string
  default = "asia-south2"
}

variable "node_disk_size" {
  type    = string
  default = "30"
}

variable "cluster_name" {
  type    = string
  default = "uaedataloop-gke-cluster"
}

variable "subnetwork" {
  type    = string
  default = "10.142.0.0/20"
}

variable "zone" {
  type    = string
  default = "asia-south2-a"
}

variable "sa" {
  type    = string
  default = ""
}

