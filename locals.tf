locals {
  // Here you can define module metadata 
  definitions = {
    resource_timeouts = {
      default = {
        create = "60m"
        read   = "5m"
        update = "60m"
        delete = "60m"
      }
    }
    tags = { ManagedBy = "Terraform" }
  }
}