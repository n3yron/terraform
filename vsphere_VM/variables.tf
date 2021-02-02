variable "esxi_hostname" {
  default = "192.168.1.21"
}

variable "esxi_hostport" {
  default = "22"
}

variable "esxi_hostssl" {
  default = "443"
}

variable "esxi_username" {
  default = "root"
}

variable "esxi_password" {
  # Unspecified will prompt
}

variable "disk_store" {
  default = "datastore1"
}
