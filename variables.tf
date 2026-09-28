variable "project_name" {
  description = "Short lowercase identifier used in resource names."
  type        = string
  default     = "rbacdemo"
}

variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "dev"
}

variable "resource_group_name" {
  description = "Azure Resource Group name."
  type        = string
  default     = "rg-rbac-managed-identity-dev"
}

variable "location" {
  description = "Azure region."
  type        = string
  default     = "westeurope"
}

variable "web_app_name" {
  description = "Globally unique Linux Web App name."
  type        = string
}

variable "app_service_sku" {
  description = "App Service Plan SKU. B1 has a cost."
  type        = string
  default     = "B1"
}

variable "tags" {
  description = "Common Azure resource tags."
  type        = map(string)
  default = {
    environment = "dev"
    project     = "azure-rbac-managed-identity"
    managed_by  = "terraform"
    portfolio   = "true"
  }
}
