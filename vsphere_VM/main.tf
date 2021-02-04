#########################################
#  ESXI Provider host/login details
#########################################
#
#   Use of variables here to hide/move the variables to a separate file
#
provider "esxi" {
#  version       = ">= 1.3"
  esxi_hostname = var.esxi_hostname
  esxi_hostport = var.esxi_hostport
  esxi_hostssl  = var.esxi_hostssl
  esxi_username = var.esxi_username
  esxi_password = var.esxi_password
}

resource "esxi_guest" "centos" {
  count = 2
  guest_name = "k8s-worker-${count.index}"
  disk_store = var.disk_store
#  guest_startup_timeout = 180

  ovf_source = "/opt/nginx.ova"
  power      = "on"
  memsize    = "4096"
  numvcpus   = "4"
  network_interfaces {
    virtual_network = "VM Network" # Required for each network interface, Specify the Virtual Network name.
  }
}

resource "esxi_guest" "centos_controller" {
  count = 1
  guest_name = "k8s-controller-${count.index}"
  disk_store = var.disk_store
#  guest_startup_timeout = 180

  ovf_source = "/opt/nginx.ova"
  power      = "on"
  memsize    = "2048"
  numvcpus   = "2"
  network_interfaces {
    virtual_network = "VM Network" # Required for each network interface, Specify the Virtual Network name.
  }
}
