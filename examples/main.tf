module "tagging-lambda" {
  source = "scholzj/tagging-lambda/aws"

  aws_region        = "eu-east-1"
  name              = "my-application"
  search_tag_key    = "myAppKey"
  search_tag_value  = "myAppValue"

  # Tags
  tags = {
    Hello = "World"
  }
}