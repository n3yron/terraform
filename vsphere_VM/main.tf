provider "esxi" {
#  version       = ">= 1.3"
  esxi_hostname = var.esxi_hostname
  esxi_hostport = var.esxi_hostport
  esxi_hostssl  = var.esxi_hostssl
  esxi_username = var.esxi_username
  esxi_password = var.esxi_password
}
resource "esxi_guest" "coreos" {
  guest_name = "${terraform.workspace}-n3yron"
  disk_store = var.disk_store
  ovf_source = "https://blog.n3yron.ru/nginx.ova"
  power      = "on"
  memsize    = "2048"
  numvcpus   = "2"
  network_interfaces {
    virtual_network = "VM Network" # Required for each network interface, Specify the Virtual Network name.
  }
}
