resource "azurerm_kubernetes_cluster_node_pool" "spot" {
  for_each = local.spot_node_pools

  lifecycle {
    ignore_changes = [
      node_count,
      tags
    ]
  }

  kubernetes_cluster_id = var.kubernetes_cluster_id
  vnet_subnet_id        = var.vnet_subnet_id

  name                   = each.value.name
  vm_size                = each.value.vm_size
  zones                  = each.value.availability_zones
  auto_scaling_enabled   = each.value.enable_auto_scaling
  host_encryption_enabled = each.value.enable_host_encryption
  node_public_ip_enabled =  each.value.enable_node_public_ip
  eviction_policy        = each.value.eviction_policy
  max_pods               = each.value.max_pods
  mode                   = each.value.mode
  node_labels            = each.value.node_labels
  node_taints            = each.value.node_taints
  orchestrator_version   = each.value.orchestrator_version
  os_disk_size_gb        = each.value.os_disk_size_gb
  os_disk_type           = each.value.os_disk_type
  os_type                = each.value.os_type
  priority               = each.value.priority
  spot_max_price         = each.value.spot_max_price
  tags                   = each.value.tags
  max_count              = each.value.max_count
  min_count              = each.value.min_count
  node_count             = each.value.node_count

  upgrade_settings {
    drain_timeout_in_minutes  = 30 
    node_soak_duration_in_minutes = 0
    max_surge = ""
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "regular" {
  for_each = local.regular_node_pools

  lifecycle {
    ignore_changes = [
      node_count,
      tags
    ]
  }

  kubernetes_cluster_id = var.kubernetes_cluster_id
  vnet_subnet_id        = var.vnet_subnet_id

  name                   = each.value.name
  vm_size                = each.value.vm_size
  zones                  = each.value.availability_zones
  auto_scaling_enabled   = each.value.enable_auto_scaling
  host_encryption_enabled = each.value.enable_host_encryption
  node_public_ip_enabled =  each.value.enable_node_public_ip
  max_pods               = each.value.max_pods
  mode                   = each.value.mode
  node_labels            = each.value.node_labels
  node_taints            = each.value.node_taints
  orchestrator_version   = each.value.orchestrator_version
  os_disk_size_gb        = each.value.os_disk_size_gb
  os_disk_type           = each.value.os_disk_type
  os_type                = each.value.os_type
  priority               = each.value.priority
  tags                   = each.value.tags
  max_count              = each.value.max_count
  min_count              = each.value.min_count
  node_count             = each.value.node_count

  upgrade_settings {
    drain_timeout_in_minutes  = 30 
    node_soak_duration_in_minutes = 0
    max_surge = ""
  }
}
