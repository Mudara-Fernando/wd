output "vm_id" {
  description = "The ID of the VM"
  value       = module.vm.vm_id
}

output "vm_public_ip" {
  description = "The public IP address of the VM"
  value       = module.vm.public_ip_address
}