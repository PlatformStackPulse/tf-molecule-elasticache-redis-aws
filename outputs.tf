output "primary_endpoint" {
  description = "Primary endpoint address for writes"
  value       = module.replication_group.primary_endpoint_address
}

output "reader_endpoint" {
  description = "Reader endpoint address for reads"
  value       = module.replication_group.reader_endpoint_address
}

output "port" {
  description = "Redis port"
  value       = module.replication_group.port
}

output "arn" {
  description = "ARN of the replication group"
  value       = module.replication_group.arn
}

output "id" {
  description = "ID of the replication group"
  value       = module.replication_group.id
}

output "subnet_group_name" {
  description = "Name of the subnet group"
  value       = module.subnet_group.name
}

output "parameter_group_name" {
  description = "Name of the parameter group"
  value       = module.parameter_group.name
}
