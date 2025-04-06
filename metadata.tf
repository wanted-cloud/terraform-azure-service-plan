locals {
  metadata = {
    resource_timeouts = merge(
      { default = { create = "30m", read = "5m", update = "30m", delete = "30m" } },
      try(local.definitions["resource_timeouts"], {}),
      try(var.metadata["resource_timeouts"], {})
    )
    tags = merge(
      try(local.definitions["tags"], {}),
      try(var.metadata["tags"], {})
    )
    validator_error_messages = merge(
      try(local.definitions["validator_error_messages"], {}),
      try(var.metadata["validator_error_messages"], {})
    )
    validator_expressions = merge(
      try(local.definitions["validator_expressions"], {}),
      try(var.metadata["validator_expressions"], {})
    )
  }
}

variable "metadata" {
  description = "Metadata definitions for the module, this is optional construct allowing override of the module defaults defintions of validation expressions, error messages, resource timeouts and default tags."
  default     = {}
  type = object({
    resource_timeouts = optional(object({
      create = optional(string, "30m")
      read   = optional(string, "5m")
      update = optional(string, "30m")
      delete = optional(string, "30m")
    }), {})
    tags                     = optional(map(string), {})
    validator_error_messages = optional(map(string), {})
    validator_expressions    = optional(map(string), {})
  })

  validation {
    condition = alltrue(
      flatten([
        for value in var.metadata.resource_timeouts : [
          for timeout in value : timeout != null
          ? can(
            regex(
              "^[0-9]+[smh]$",
              timeout
            )
          )
          : true
        ]
      ])
    )
    error_message = "Resource timeouts must be in the format of 30m, 5s, 1h etc. as specified by the regex."
  }
}
