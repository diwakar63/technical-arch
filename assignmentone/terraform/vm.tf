resource "azurerm_network_interface" "main" {
  name                = "${local.name}-nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = data.azurerm_subnet.subnetname.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = var.tags
}

resource "azurerm_managed_disk" "main" {
  name                 = "${local.name}-data"
  location             = var.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_type = var.disk_type
  create_option        = "Empty"
  disk_size_gb         = var.disk_size
  tags                 = var.tags
}

resource "azurerm_virtual_machine" "main" {
  name                  = "${local.name}-vm"
  location              = var.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = var.vm_size


  storage_image_reference {
    publisher = var.img_publisher
    offer     = var.img_offer
    sku       = var.img_sku
    version   = var.img_version
  }

  storage_os_disk {
    name              = "${local.name}-os"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  os_profile {
    computer_name  = local.name
    admin_username = var.admin_user
  }

  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      key_data = var.ssh_key
      path     = "/home/${var.admin_user}/.ssh/authorized_keys"
    }
  }

  tags = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "main" {
  managed_disk_id    = azurerm_managed_disk.main.id
  virtual_machine_id = azurerm_virtual_machine.main.id
  lun                = var.lun
  caching            = "None"
}
