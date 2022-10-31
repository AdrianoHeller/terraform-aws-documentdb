resource "aws_docdb_global_cluster" "db_test" {
  global_cluster_identifier = "globaldbtest"
  engine                    = "docdb"
  engine_version            = "4.0.0"
}

resource "aws_docdb_cluster" "primary" {
  provider                  = aws.primary
  engine                    = aws_docdb_global_cluster.db_test.engine
  engine_version            = aws_docdb_global_cluster.db_test.engine_version
  cluster_identifier        = "globaldbclusterid"
  master_username           = var.db_user
  master_password           = var.db_pass
  global_cluster_identifier = aws_docdb_global_cluster.db_test.id
  db_subnet_group_name      = "default"
}

resource "aws_docdb_cluster_instance" "primary" {
  provider             = aws.primary
  engine               = aws_docdb_global_cluster.db_test.engine
  engine_version       = aws_docdb_global_cluster.db_test.engine_version
  identifier           = "globaldbclusterinstance"
  cluster_identifier   = aws_docdb_cluster.primary.id
  instance_class       = var.instance_class
  db_subnet_group_name = "default"
}
