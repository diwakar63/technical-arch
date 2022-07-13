#Application variables
application_name = "app_name"
role             = "server"
dtap             = "staging"

#Subscription
tenant_id       = "tenant_id"
subscription_id = "subscription_id"
location        = "location"

#Virtual Network
vnet_name   = "VNET-name"
vnet_rg     = "RG-vnet"
subnet_name = "subnet-name"

#Virtual Machine
vm_size = "Standard_D8as_v5"

#Managed Disk // Data Disk
disk_type = "Standard_LRS"
disk_size = "5000"
lun       = "10"

#Azure Platform Image // OS Image
img_publisher = "Canonical"
img_offer     = "UbuntuServer"
img_sku       = "18.04-LTS"
img_version   = "latest"

#OS_User
admin_user = "adminuser"
ssh_key    = "ssh_public_key"

#Tags
tags = {
  "application" : "app",
  "stage" : "staging",
  "service" : "app",
}
