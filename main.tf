/*
 * # wanted-cloud/terraform-azure-service-plan
 * 
 * Terraform building block module managing Azure Service Plan resource.
 */

resource "azurerm_service_plan" "this" {
  name                            = var.name
  resource_group_name             = data.azurerm_resource_group.this.name
  location                        = var.location != "" ? var.location : data.azurerm_resource_group.this.location
  os_type                         = var.os_type
  sku_name                        = var.sku_name
  worker_count                    = var.worker_count == 0 ? null : var.worker_count
  zone_balancing_enabled          = var.zone_balancing_enabled
  per_site_scaling_enabled        = var.per_site_scaling_enabled
  maximum_elastic_worker_count    = var.maximum_elastic_worker_count == 0 ? null : var.maximum_elastic_worker_count
  premium_plan_auto_scale_enabled = var.premium_plan_auto_scale_enabled

  tags = merge(local.metadata.tags, var.tags)

  timeouts {
    create = try(
      local.metadata.resource_timeouts["azurerm_service_plan"]["create"],
      local.metadata.resource_timeouts["default"]["create"]
    )
    read = try(
      local.metadata.resource_timeouts["azurerm_service_plan"]["read"],
      local.metadata.resource_timeouts["default"]["read"]
    )
    update = try(
      local.metadata.resource_timeouts["azurerm_service_plan"]["update"],
      local.metadata.resource_timeouts["default"]["update"]
    )
    delete = try(
      local.metadata.resource_timeouts["azurerm_service_plan"]["delete"],
      local.metadata.resource_timeouts["default"]["delete"]
    )
  }

}