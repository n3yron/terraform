output "ip" {
  value = [esxi_guest.centos.*.ip_address]
}
output "ip_of_controller" {
  value = [esxi_guest.centos_controller.*.ip_address]
}
