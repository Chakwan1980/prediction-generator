
npm install aws-sdk           # 


Comandos Adicionales de Terraform
1. Gestión del Estado
terraform state rm <resource> 
*Elimina un recurso del estado sin destruirlo. Útil si quieres dejar de gestionar un recurso con Terraform.

terraform state mv <source> <destination>: 
**Mueve un recurso de un lugar a otro en el estado, útil para renombrar o reorganizar recursos.

terraform state replace-provider <old> <new>: 
**Reemplaza un proveedor en el estado, útil para migrar a una nueva versión del proveedor.

terraform state pull > state.tfstate: 
**Guarda el estado actual en un archivo local.

2. Módulos y Workspaces
terraform module: Permite trabajar con módulos y gestionar dependencias.

terraform workspace list: Muestra todos los espacios de trabajo disponibles.

terraform workspace new <name>: 
**Crea un nuevo espacio de trabajo.

terraform workspace select <name>: 
**Cambia al espacio de trabajo especificado.

3. Gestión de Recursos
terraform taint <resource>: 
**Marca un recurso para que sea destruido y recreado en la próxima aplicación.
* Esto es útil para forzar la recreación de recursos que pueden estar en un estado incorrecto.

terraform untaint <resource>: 
*Revierte la marca de un recurso que ha sido marcado como "tainted".

4. Comandos de Debugging
TF_LOG=DEBUG terraform apply:
* Habilita el registro detallado de depuración para el comando. Puedes cambiar DEBUG a otros niveles como TRACE, INFO, o ERROR.

terraform console: 
*Inicia una consola interactiva de Terraform donde puedes evaluar expresiones y verificar recursos.

5. Gestionar Backends Remotos
terraform init -backend-config=<file>: 
*Inicializa un backend remoto utilizando un archivo de configuración específico.
6. Configuraciones Avanzadas
terraform plan -out=tfplan: 
*Guarda el plan de ejecución en un archivo, que se puede aplicar más tarde con terraform apply tfplan.

terraform apply "tfplan": 
*Aplica el plan guardado sin tener que regenerarlo.

7. Comandos de Importación
terraform import <resource> <id>: 
*Importa un recurso existente en Terraform, permitiendo que Terraform gestione ese recurso.
* Este comando es útil cuando se quiere comenzar a usar Terraform en una infraestructura existente.
8. Trabajar con Variables y Salidas
terraform output -json: 
*Muestra las salidas en formato JSON, útil para la integración con otros sistemas o herramientas.
9. Configurar Proveedores
terraform providers: 
*Muestra los proveedores utilizados en la configuración actual y su versión.
10. Gestionar Recursos Condicionalmente
count y for_each: 

bash
Code kopieren
# Inicializa el directorio de trabajo
terraform init

# Crea un nuevo espacio de trabajo
terraform workspace new development

# Valida la configuración
terraform validate

# Muestra el plan de ejecución y guarda el plan
terraform plan -out=tfplan

# Aplica el plan guardado
terraform apply "tfplan"

# Importa un recurso existente
terraform import aws_instance.example i-1234567890abcdef0

# Marca un recurso como "tainted" para que se recree
terraform taint aws_instance.example

# Muestra el estado actual
terraform show

# Destruye los recursos
terraform destroy

terraform state show module.prediction_dynamodb_table.aws_dynamodb_table.dynamodb_table