resource "azurerm_postgresql_server" "db" {
  name                = "${local.name}-db"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  administrator_login          = var.db_admin_login
  administrator_login_password = var.db_admin_password

  sku_name   = var.db_sku
  version    = var.db_version
  storage_mb = var.db_storage

  backup_retention_days        = 31
  geo_redundant_backup_enabled = true
  auto_grow_enabled            = true

  public_network_access_enabled    = false
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_2"

  tags = var.tags
}

resource "azurerm_postgresql_database" "db" {
  name                = "app_db_name"
  resource_group_name = azurerm_postgresql_server.db.resource_group_name
  server_name         = azurerm_postgresql_server.db.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

resource "azurerm_private_endpoint" "private-endpoint" {
  name                = "${local.name}-db-private-endpoint"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = data.azurerm_subnet.subnetname.id

  private_service_connection {
    name                           = "${local.name}-db-private-endpoint"
    private_connection_resource_id = azurerm_postgresql_server.db.id
    is_manual_connection           = false
    subresource_names              = ["postgresqlServer"]
  }

  tags = var.tags
}

resource "azurerm_private_dns_a_record" "db-dns-record" {
  name                = azurerm_postgresql_server.db.name
  zone_name           = dnszone_name
  resource_group_name = dnszone_rg_name
  ttl                 = 300
  records             = [azurerm_private_endpoint.private-endpoint.private_service_connection[0].private_ip_address]

  tags = var.tags
}
