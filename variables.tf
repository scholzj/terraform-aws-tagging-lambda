variable "aws_region" {
    description = "Region where Cloud Formation is created"
    default     = "eu-central-1"
}

variable "cluster_name" {
    description = "Name of the AWS Minikube cluster - will be used to name all created resources"
}

variable "tags" {
    description = "Tags used for the AWS resources created by this template"
    type        = "map"
}
