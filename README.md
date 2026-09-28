# Azure RBAC + Managed Identity (Terraform)

Proyecto de infraestructura como código para demostrar una práctica esencial de Azure: una aplicación accede a un recurso sin almacenar usuarios, contraseñas ni claves.

## Qué demuestra

Una Linux Web App recibe una **identidad administrada por el sistema** en Microsoft Entra ID. Terraform asigna a esa identidad el rol integrado **Storage Blob Data Reader** sobre un único Storage Account.

```text
Linux Web App
  |
  | Identidad administrada (Microsoft Entra ID)
  v
Azure RBAC role assignment
  | Rol: Storage Blob Data Reader
  | Scope: un Storage Account concreto
  v
Blob container
```

No se da el rol `Contributor`, no se asignan permisos en toda la suscripción y no se publican claves. Es el principio de **mínimo privilegio**: solo lectura, solo sobre el recurso que la aplicación necesita.

## Recursos creados

- Resource Group.
- Storage Account con acceso público a blobs desactivado y TLS 1.2 mínimo.
- Contenedor privado para blobs.
- Linux App Service Plan y Linux Web App con HTTPS obligatorio.
- Identidad administrada asignada por el sistema.
- Asignación `Storage Blob Data Reader` para la identidad de la aplicación, limitada al Storage Account.

## Despliegue

```powershell
Copy-Item terraform.tfvars.example terraform.tfvars
terraform init
terraform validate
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
```

## Cómo explicarlo en una entrevista

> La Web App tiene una identidad propia en Microsoft Entra ID. Con Azure RBAC le concedo solamente `Storage Blob Data Reader` sobre un Storage Account concreto. Así, si una aplicación se comprometiera, su alcance queda limitado y no existe una clave de Storage que pueda filtrarse.

## Decisiones de diseño

- **Identidad administrada:** elimina secretos estáticos.
- **Rol de datos, no de administración:** permite leer blobs, pero no crear recursos Azure.
- **Scope mínimo:** el rol se asigna al Storage Account, no al Resource Group ni a la suscripción.
- **Sin apply en GitHub Actions:** el flujo público solo valida Terraform.
