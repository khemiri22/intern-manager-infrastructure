resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = lower(var.cluster_name)

  kubernetes_version = var.kubernetes_version

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }

  default_node_pool {
    name               = "default"
    node_count         = var.node_count
    vm_size            = var.node_vm_size
    os_disk_size_gb    = 30
    type               = "VirtualMachineScaleSets"
    vnet_subnet_id     = var.vnet_subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "production"
    managed_by  = "terraform"
  }
}