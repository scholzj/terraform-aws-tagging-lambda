variable "aws_region" {
    description = "Region where Cloud Formation is created"
    default     = "eu-east-1"
}

variable "name" {
    description = "Name of the installation we are tagging - will be used to name all resources unless they already have a `Name` tag."
}

variable "search_tag_key" {
    description = "The Key of the tag which determines resources belonging to the application. All resources with matching tag and its value will be tagged with additional tags."
}

variable "search_tag_value" {
    description = "The Valur of the tag which determines resources belonging to the application. All resources with matching tag and its value will be tagged with additional tags."
}

variable "name" {
    description = "Name of the installation we are tagging - will be used to name all resources unless they already have a `Name` tag."
}

variable "tags" {
    description = "Tags used for the AWS resources created by this template"
    type        = "map"
}
