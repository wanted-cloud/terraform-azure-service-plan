variable "name" {
  description = "Name of the Azure service plan."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group in which the Azure service plan will be created."
  type        = string
}

variable "location" {
  description = "Location of the resource group in which the Azure service plan will be created, if not set it will be the same as the resource group."
  type        = string
  default     = ""
}

variable "os_type" {
  description = "The OS type of the service plan. This is required for Linux service plans."
  type        = string
  default     = "Linux"
}

variable "sku_name" {
  description = "The SKU name of the service plan."
  type        = string
  default     = "B1"
}

variable "tags" {
  description = "Key value pairs to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "worker_count" {
  description = "The number of workers to assign to the service plan."
  type        = number
  default     = 0
}

variable "zone_balancing_enabled" {
  description = "Enable zone balancing for the service plan."
  type        = bool
  default     = false
}

variable "per_site_scaling_enabled" {
  description = "Enable per site scaling for the service plan."
  type        = bool
  default     = false
}

variable "premium_plan_auto_scale_enabled" {
  description = "Enable auto scaling for the premium service plan."
  type        = bool
  default     = false
}

variable "maximum_elastic_worker_count" {
  description = "The maximum number of elastic workers for the premium service plan."
  type        = number
  default     = 0
}

variable "app_service_environment_id" {
  description = "The ID of the App Service Environment to which the service plan belongs."
  type        = string
  default     = ""
}