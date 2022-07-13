application_name = "app_name"
role             = "server"
dtap             = "staging"

tenant_id       = "tenant_id"
subscription_id = "subscription_id"
location        = "location"

vnet_name   = "VNET-name"
vnet_rg     = "RG-vnet"
subnet_name = "subnet-name"

vm_size = "Standard_D4as_v5"

disk_type = "Standard_LRS"
disk_size = "50"
lun       = "15"

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

db_admin_login    = "dbadmin"
db_sku            = "GP_Gen5_4"
db_version        = "11"
db_storage        = "64512"
db_admin_password = "wen$#32DKG"
