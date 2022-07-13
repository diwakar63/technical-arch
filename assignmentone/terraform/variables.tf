#AppName
variable "application_name" {
  type        = string
  description = "Name of the application."
}
variable "subscription_id" {
  type        = string
  description = "The Subscription ID which should be used."
}
variable "tenant_id" {
  type        = string
  description = "The Tenant ID which should be used. This can also be sourced from the ARM_TENANT_ID Environment Variable."
}
variable "location" {
  type        = string
  description = "Specifies the Azure Region where the Virtual Machine exists"
}
variable "subnet_name" {
  type        = string
  description = "Specifies the Subnet name in which Virtual Machine resides"
}
variable "vm_size" {
  type        = string
  description = "Specifies the size of the Virtual Machine"
}
variable "vnet_name" {
  type        = string
  description = "Specifies the Virtual Netowrk name in which Virtual Machine resides"
}
variable "vnet_rg" {
  type        = string
  description = "Name of the vnet resource group"
}
#Managed Disk // Data Disk
variable "disk_type" {
  type        = string
  description = "The type of storage to use for the managed disk"
}
variable "disk_size" {
  type        = string
  description = "The size of the managed disk to create in gigabytes"
}
variable "lun" {
  type        = string
  description = "The Logical Unit Number of the Data Disk"
}
#Azure Platform Image // OS Image
variable "img_publisher" {
  type        = string
  description = "Specifies the publisher of the image used to create the virtual machine"
}
variable "img_offer" {
  type        = string
  description = "Specifies the offer of the image used to create the virtual machine"
}
variable "img_sku" {
  type        = string
  description = "Specifies the SKU of the image used to create the virtual machine"
}
variable "img_version" {
  type        = string
  description = "Specifies the version of the image used to create the virtual machine"
}
variable "role" {
  type        = string
  description = "This variable tells role assigned to this server"
}
variable "dtap" {
  type        = string
  description = "This variable tells dtap stage of the deployment: development, test, acceptance or production"
}
variable "admin_user" {
  type        = string
  description = "User name of the admin user on which you will be able to login using ssh keys."
}
variable "ssh_key" {
  type        = string
  description = "SSH key for the admin user."
}
#Tags
variable "tags" {
  description = "A map of the tags to use for tagging resources that are deployed"
  type        = map(any)
}
