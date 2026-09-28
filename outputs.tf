output "web_app_url" {
  description = "HTTPS URL of the Linux Web App."
  value       = "https://${azurerm_linux_web_app.this.default_hostname}"
}

output "storage_account_name" {
  description = "Storage Account receiving the scoped RBAC assignment."
  value       = azurerm_storage_account.this.name
}

output "web_app_principal_id" {
  description = "Microsoft Entra object ID of the managed identity."
  value       = azurerm_linux_web_app.this.identity[0].principal_id
}
