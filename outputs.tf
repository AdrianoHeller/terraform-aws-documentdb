output "document_db_cluster_id" {
  value = aws_docdb_cluster.primary.id
}

output "document_db_instance_id" {
  value = aws_docdb_cluster_instance.primary.id
}