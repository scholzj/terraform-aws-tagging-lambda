# AWS Tagging Lambda

When you operate complex applications in AWS, you will sooner or later create some additional resources like volumes or load balancers. You might need to attach some tags to these resources. This repository contains installation of AWS Lambda function which will go through all your resources, identify them based on a configured tag which should contain ta specific value. For every resource it find it will make sure that the desired tags are attached.

<!-- TOC -->

- [AWS Tagging Lambda](#aws-tagging-lambda)
    - [Prerequisites and dependencies](#prerequisites-and-dependencies)
    - [Tagging Kubernetes clusters](#tagging-kubernetes-clusters)
    - [Using as standalone Terraform configuration](#using-as-standalone-terraform-configuration)
        - [Deploying tagging lambda](#deploying-tagging-lambda)
        - [Deleting tagging lambda](#deleting-tagging-lambda)
    - [Using as a Terraform module](#using-as-a-terraform-module)
    - [Tagged resources](#tagged-resources)

<!-- /TOC -->

## Prerequisites and dependencies

* The Lambda deployment is written using [Terraform](https://www.terraform.io)
* Generating of the lambda function from the template and packing it into ZIP archive expects `bash` and `zip` being available.
* This deployment might not work on Windows machine. Tested only on Linux and macOS

## Tagging Kubernetes clusters

This Lambda fucntion was originally developed for tagging Kubernetes cluster and their resources. But it should work with other applications as well.

## Using as standalone Terraform configuration

The configuration is done through Terraform variables. Example *tfvars* file is part of this repo and is named `example.tfvars`. Change the variables to match your environment / requirements before running `terraform apply ...`.

| Option | Explanation | Example |
|--------|-------------|---------|
| `aws_region` | AWS region which should be used | `eu-central-1` |
| `name` | Name of the Kubernetes cluster (used to find the resources for tagging but also to name resources created by this configuration) | `my-minikube` |
| `search_tag_key` | The Key of the tag which determines resources belonging to the application. All resources with matching tag and its value will be tagged with additional tags. | `kubernetes.io/cluster/aws-k8s` |
| `search_tag_value` | The Valur of the tag which determines resources belonging to the application. All resources with matching tag and its value will be tagged with additional tags. | `owned` |
| `tags` | Tags which should be applied to all resources | `{ Hello = "World" }` |

### Deploying tagging lambda

To deploy the tagging lambda, 
* Export AWS credentials into environment variables `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
* Apply Terraform configuration with tagging lambda:
```bash
terraform init
terraform apply --var-file example.tfvars
```

### Deleting tagging lambda

To delete tagging lambda, 
* Export AWS credentials into environment variables `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
* Destroy Terraform configuration:
```bash
terraform destroy --var-file example.tfvars
```

## Using as a Terraform module

Although it can be run on its own, the main value is that it can be included into another Terraform configuration.

```hcl
module "tagging-lambda" {
  source = "scholzj/tagging-lambda/aws"

  aws_region        = "eu-east-1"
  name              = "my-application"
  search_tag_key    = "kubernetes.io/cluster/aws-k8s"
  search_tag_value  = "owned"

  # Tags
  tags = {
    Hello = "World"
  }
}
```

An example of how to include this can be found in the [examples](examples/) dir.
## Tagged resources

* EC2 instances
* Network interfaces
* EBS Volumes
* Security Groups
* Internet Gateways
* DHCP Option sets
* Subnets
* Route tables
* VPCs
* Network ACLs
* Autoscaling Groups
* Elastic Loadbalancers