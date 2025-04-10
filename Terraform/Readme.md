# AWS VPC Architecture with Terraform
![Blank diagram](https://github.com/user-attachments/assets/586b0bf1-76ec-4bee-931c-c533fb3e0392)

## Project Overview

This project implements a highly available and secure AWS infrastructure using Terraform as the Infrastructure as Code (IaC) tool. The architecture follows AWS best practices with a multi-AZ setup, separation of public and private resources, and proper network security controls.

## Architecture Components

### VPC Configuration
- **VPC CIDR Block**: 10.0.0.0/16
- **Region**: Single region deployment 
- **Availability Zones**: 2 AZs for high availability and fault tolerance

### Networking Layer
- **Public Subnets**: Deployed across two AZs, hosting web servers and NAT gateways
- **Private Subnets**: Deployed across two AZs, hosting database servers
- **Internet Gateway**: Providing public subnet access to the internet
- **NAT Gateway**: Enabling outbound internet connectivity for resources in the private subnets

### Compute Resources
- **Web Servers**: EC2 instances deployed in public subnets
- **Security Groups**: Configured to allow only necessary traffic to web servers

### Database Layer
- **Amazon RDS**: Multi-AZ deployment in private subnets
- **Database Security**: Isolated in private subnets with no direct internet access

## Terraform Implementation

### Directory Structure
```
├── main.tf                  # Main Terraform configuration
├── variables.tf             # Variable declarations
├── outputs.tf               # Output definitions
├── modules/
│   ├── vpc/                 # VPC module
│   ├── web_servers/         # Web server module
│   ├── database/            # RDS database module
│   └── security/            # Security groups module
├── terraform.tfvars         # Variable values
└── README.md                # Project documentation
```

### Key Terraform Resources
- `aws_vpc`: Defines the main VPC
- `aws_subnet`: Configures public and private subnets
- `aws_internet_gateway`: Provides internet access
- `aws_nat_gateway`: Enables outbound internet access for private subnets
- `aws_route_table` and `aws_route`: Manages routing for subnets
- `aws_instance`: Deploys EC2 instances for web servers
- `aws_db_instance`: Sets up RDS instances in multiple AZs
- `aws_security_group`: Controls inbound and outbound traffic

## Deployment Instructions

### Prerequisites
- AWS account and configured credentials
- Terraform v1.0+ installed
- AWS CLI configured

### Deployment Steps
1. Clone the repository
2. Navigate to the project directory
3. Modify `terraform.tfvars` with your specific configurations
4. Initialize the Terraform working directory:
   ```
   terraform init
   ```
5. Preview the changes to be applied:
   ```
   terraform plan
   ```
6. Apply the configuration:
   ```
   terraform apply
   ```
7. Confirm by typing `yes` when prompted

### Verification
After successful deployment, verify the resources:
1. Check the AWS Management Console to confirm resource creation
2. Verify connectivity to the web servers via their public IPs
3. Confirm the database is accessible from web servers but not from the internet

## Security Features

### Network Security
- Public and private subnet isolation
- Security groups limiting inbound and outbound traffic
- NAT gateway providing internet access to private resources while maintaining security

### Data Security
- Databases deployed in private subnets with no direct internet access
- Encrypted data in transit and at rest
- IAM roles following principle of least privilege

## Scaling and High Availability

### Multi-AZ Deployment
- Resources distributed across two Availability Zones
- Automatic failover for RDS databases

### Future Scaling Considerations
- Auto Scaling groups for web servers (configurable via Terraform)
- Read replicas for database scaling
- Application Load Balancer integration

## Management and Monitoring

### Infrastructure Management
- All resources managed as code through Terraform
- State file maintained for infrastructure tracking
- Version-controlled configuration enabling consistent deployments

### Monitoring Capabilities
- CloudWatch integration for metrics and logs
- SNS alerts for critical events
- Health checks for key resources

## Cost Optimization

### Resource Efficiency
- Right-sized instances based on workload requirements
- Multi-AZ only for critical components
- Proper tagging for cost allocation

## Cleanup Instructions

To destroy the infrastructure and avoid ongoing charges:
```
terraform destroy
```
Confirm by typing `yes` when prompted.

## Additional Resources

- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS Architecture Center](https://aws.amazon.com/architecture/)
- [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/)
