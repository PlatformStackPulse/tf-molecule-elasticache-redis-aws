module "subnet_group" {
  source = "git::https://github.com/PlatformStackPulse/tf-atom-elasticache-subnet-group-aws.git?ref=v1.1.0"

  enabled   = module.this.enabled
  namespace = var.namespace
  name      = var.name
  stage     = var.stage
  tags      = var.tags

  subnet_ids = var.subnet_ids
}

module "parameter_group" {
  source = "git::https://github.com/PlatformStackPulse/tf-atom-elasticache-parameter-group-aws.git?ref=v1.1.0"

  enabled   = module.this.enabled
  namespace = var.namespace
  name      = var.name
  stage     = var.stage
  tags      = var.tags

  family     = var.parameter_group_family
  parameters = var.parameters
}

module "replication_group" {
  source = "git::https://github.com/PlatformStackPulse/tf-atom-elasticache-replication-group-aws.git?ref=v1.1.0"

  enabled   = module.this.enabled
  namespace = var.namespace
  name      = var.name
  stage     = var.stage
  tags      = var.tags

  node_type            = var.node_type
  num_cache_clusters   = var.num_cache_clusters
  port                 = var.port
  engine_version       = var.engine_version
  parameter_group_name = module.parameter_group.name
  subnet_group_name    = module.subnet_group.name
  security_group_ids   = var.security_group_ids

  automatic_failover_enabled = var.automatic_failover_enabled
  multi_az_enabled           = var.multi_az_enabled

  at_rest_encryption_enabled = true
  transit_encryption_enabled = true
  auth_token                 = var.auth_token

  snapshot_retention_limit = var.snapshot_retention_limit
  snapshot_window          = var.snapshot_window
  maintenance_window       = var.maintenance_window
  apply_immediately        = var.apply_immediately
}
