resource "azurerm_kubernetes_cluster" "aks" {
  name = var.name
  location = var.location
  resource_group_name = var.rg_name
  dns_prefix = "aksdemo"

  default_node_pool {
    name = "default"
    node_count = var.node_count
    vm_size = "Standard_D2_v3"
    vnet_subnet_id = var.subnetid
  }
network_profile {
  network_plugin = "azure"
  service_cidr = var.subnet_cidr
  dns_service_ip = var.dns_service_ip
}
  identity {
    type = "SystemAssigned"
  }
}