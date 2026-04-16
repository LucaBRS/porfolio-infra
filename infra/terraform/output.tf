# Output dell'IP del server — usato da Ansible per connettersi
output "server_ip" {
  description = "IP pubblico del VPS"
  value       = hcloud_server.portfolio.ipv4_address
}

output "server_name" {
  description = "Nome del server"
  value       = hcloud_server.portfolio.name
}