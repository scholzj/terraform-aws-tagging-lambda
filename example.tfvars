aws_region    = "eu-east-1"

# Used for naming related resources
lambda_name  = "my-k8s"

# The Key of the tag which determines resources belonging to the application. All resources with matching tag and its value will be tagged with additional tags.
search_tag_key   = "kubernetes.io/cluster/my-k8s"
search_tag_value = "owned"

# Tags
tags = {
  Owner     = "johndoe"
}
