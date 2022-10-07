output "instance_name" {
  value = aws_instance.app_server[*].tags_all["Name"]
}

output "public_ip" {
  value = aws_instance.app_server[*].public_ip
}
