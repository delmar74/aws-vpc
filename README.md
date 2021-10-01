# Task

Create a terraform template for AWS VPC. We will use this VPC later for running our workloads

A template should contain the following resources:
- VPC
- At least two public subnets
- At least two private subnets
- Internet gateway
- At least two NAT gateways
- Public route table
- Private route table

You should be able to launch a virtual machine in a private subnet, establish an SSH connection to it, and download updates from the internet.

# How it works

**Amazon Virtual Private Cloud (VPC)** gives you complete control over your virtual networking environment including resource placement, connectivity, and security.

The first step is to create your VPC. 
Then you can add resources to it, such as Amazon Elastic Compute Cloud (EC2) and Amazon Relational Database Service (RDS) instances. 
Finally, you can define how your VPCs communicate with each other, across accounts, Availability Zones (AZs), or Regions. 

In this case network traffic is being shared between two VPCs within each region.

![image](https://user-images.githubusercontent.com/29066922/135612835-93fd9772-01ba-4a38-b65a-78d9dc4a1961.png)

![image](https://eadn-wc03-4064062.nxedge.io/cdn/wp-content/uploads/2020/11/Picture2-2.png)

![image](https://jayendrapatil.com/wp-content/uploads/2016/03/AWS-VPC-Components.png)

#### Links

- [VPC with public and private subnets (NAT)](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Scenario2.html)
- [HashiCorp Learn > Get Started - AWS](https://learn.hashicorp.com/collections/terraform/aws-get-started)
- [(Book) Terraform Up and Running](https://github.com/shakthi-divyaa/books-1/blob/master/dev-ops/terraform/terraform-up-and-running.pdf)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

