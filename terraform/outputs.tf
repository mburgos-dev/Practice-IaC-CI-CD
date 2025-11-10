output "created_file" {
  description = "Fileroute"
  value       = local_file.file.filename
}

output "content" {
  description = "Text inside"
  value       = local_file.file.content
}