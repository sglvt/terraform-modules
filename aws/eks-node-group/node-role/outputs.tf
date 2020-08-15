output "profile_name" {
  value = aws_iam_instance_profile.node_profile.name
}

output "role_arn" {
  value = aws_iam_role.node_role.arn
}