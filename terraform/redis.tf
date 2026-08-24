resource "aws_elasticache_subnet_group" "redis" {
  name       = "${var.project_name}-redis-subnet-group"
  subnet_ids = [for s in aws_subnet.private : s.id]
}

resource "aws_elasticache_replication_group" "redis" {
  replication_group_id       = "${var.project_name}-redis"
  description                = "Redis cache for ecommerce"
  engine                     = "redis"
  node_type                  = "cache.t3.micro"
  num_cache_clusters         = 1
  port                       = 6379
  automatic_failover_enabled = false
  multi_az_enabled           = false

  subnet_group_name  = aws_elasticache_subnet_group.redis.name
  security_group_ids = [aws_security_group.redis.id]
}
