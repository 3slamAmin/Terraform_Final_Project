## Terraform Project: AWS Infrastructure Setup in Multiple Regions

This Terraform project automates the setup of basic AWS infrastructure including VPC, subnets, internet gateway, NAT gateway, route tables, EC2 instance, DynamoDB table, and a VPC endpoint for DynamoDB in two different regions.

### Key Components:
---

#### Inside The Module:

- **VPC**: Defines the virtual private cloud.
- **Subnets**: Creates public and private subnets for segmentation.
- **Internet Gateway**: Provides internet access to resources in the VPC.
- **NAT Gateway**: Allows private subnet resources to access the internet.
- **Route Tables**: Manages routing between subnets and the internet.
- **EC2 Instance**: Deploys a virtual server in the public subnet.
- **DynamoDB Table**: Sets up a NoSQL database within the private subnet.
- **VPC Endpoint**: Enables private communication with DynamoDB without internet access inside the private subnet.

#### In Main:
module call: takes region and instance type before calling the module

### Usage:

1. Clone the repository containing the Terraform configuration.
2. Customize variables like `instance_type` and `aws_region` as needed.
3. Initialize Terraform: `terraform init`.
4. Review the execution plan: `terraform plan`.
5. Apply the changes: `terraform apply`.
