# Instruction for Copilot VSC extension

This is a Terraform module template repository, it represents template of building block module consisting some custom constructs allowing us to use all the advatages of outisde configuration and serialized module behavior. Those constructs are place in `metadata.tf` and this file is not modified (there are some exceptions) and present in all of our modules.

## Module structure

Our Terraform modules typically follow this structure:

```
terraform-module-template/
├── main.tf                 # Primary module resources and logic
├── variables.tf            # Input variable declarations
├── outputs.tf              # Output value declarations
├── versions.tf             # Terraform and provider version constraints
├── metadata.tf             # Custom constructs for configuration (do not modify)
├── README.md               # Module documentation
├── .terraform-docs.yaml    # Terraform DOCS generator configuration
├── examples/               # Example implementations
│   └── basic/              # Basic example implementation
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
└── .github/                # GitHub workflows and configuration files
    ├── workflows/
    │   └── terraform.yaml  # CI/CD pipeline
    └── COPILOT-INSTRUCTIONS.md
```

## Working with this template

When creating a new module:

1. Use this template as a starting point
2. Define your input variables in `variables.tf`
3. Implement module resources in `main.tf`
4. Define output values in `outputs.tf`
5. Specify version requirements in `versions.tf`
6. Update the README with appropriate documentation
7. Create example implementations in the `examples/` directory
8. Example 

Remember that `metadata.tf` contains special constructs and should generally not be modified.

