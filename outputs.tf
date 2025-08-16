output "primary_instance_public_ip" {
  value = aws_instance.demo_instance.public_ip
}

output "secondary_instance_id" {
  value = aws_instance.demo_instance_secondary.id
}
