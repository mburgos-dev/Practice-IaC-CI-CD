terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

provider "local" {}

# Crea o actualiza el archivo HTML
resource "local_file" "web_content" {
  filename = "${path.module}/../app/index.html"
  content  = "<h1>Hi from Terraform</h1>"
}

# Ejecuta Ansible después
resource "null_resource" "run_ansible" {
  triggers = {
    web_content = local_file.web_content.content
    timestamp   = timestamp()
  }

  depends_on = [local_file.web_content]

  provisioner "local-exec" {
    command = "ansible-playbook -i ../ansible/inventory.ini ../ansible/playbook.yml"
  }
}
