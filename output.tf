# output.tf

output "name" {
  value = aws_emr_cluster.cluster.name
}

output "applications" {
  value = aws_emr_cluster.cluster.applications
}
output "release_label" {
  value = aws_emr_cluster.cluster.release_label
}