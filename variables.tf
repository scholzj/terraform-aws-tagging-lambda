variable "aws_region" {
    description = "Region where Cloud Formation is created"
    default     = "us-east-1"
}

variable "lambda_name" {
    description = "Will be used to name the tagging lambda, its roles etc."
}

variable "search_tag_key" {
    description = "The Key of the tag which determines resources belonging to the application. All resources with matching tag and its value will be tagged with additional tags."
}

variable "search_tag_value" {
    description = "The Valur of the tag which determines resources belonging to the application. All resources with matching tag and its value will be tagged with additional tags."
}

variable "tags" {
    description = "Tags used for the AWS resources created by this template"
    type        = "map"
}
