aws_region    = "eu-east-1"

# Used for naming related resources
cluster_name  = "my-minikube"

# The Key of the tag which determines resources belonging to the application. All resources with matching tag and its value will be tagged with additional tags.
search_tag_key   = "kubernetes.io/cluster/my-minikube"
search_tag_value = "owned"

# Tags
tags = {
  Owner     = "johndoe"
}
