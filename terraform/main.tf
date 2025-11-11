terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

provider "local" {}

# Recurso "ficticio" que simula la creación de infraestructura
resource "local_file" "infra" {
  content  = "Infraestructura desplegada con Terraform"
  filename = "${path.module}/infra.txt"
}

# Ejecuta Ansible automáticamente después de crear el archivo
resource "null_resource" "configure_with_ansible" {
  depends_on = [local_file.infra]

  provisioner "local-exec" {
    command = "ansible-playbook -i ../ansible/inventory.ini ../ansible/playbook.yml"
  }
}
