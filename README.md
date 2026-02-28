#  Secure IaC Deployment with Terraform, Ansible & Monitoring Stack

This project demonstrates a complete production-style Infrastructure and Configuration Automation setup using:

- **Terraform** (Infrastructure as Code)
- **Ansible** (Configuration Management)
- **AWS EC2 + VPC Architecture**
- **MySQL & PostgreSQL Database Setup**
- **Docker Swarm**
- **Prometheus & Grafana Monitoring**
- **Log Rotation & System Logging**

---

#  Project Objective

Design and deploy:

- A secure AWS VPC with public & private subnets
- NAT Gateway for outbound internet
- EC2 instance inside private subnet
- Environment separation using `tfvars`
- Install and configure services using Ansible:
  - Nginx
  - MySQL
  - PostgreSQL
  - Docker Swarm
  - Create DB users and seed sample data
  - Configure log rotation
  - Set up full monitoring stack using Prometheus + Grafana

---

#  Architecture Overview

## Infrastructure Components

- Custom VPC
- Public Subnet
- Private Subnet
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- Key Pair
- EC2 Instance (Private Subnet)

###  Security Design

- EC2 deployed in private subnet
- NAT Gateway provides outbound internet
- SSH restricted via Security Group
- HTTP controlled via Security Group

---

#  Repository Structure
```text
terraform/
│
├── main.tf
├── variables.tf
├── outputs.tf
│
├── dev/
│ └── terraform.tfvars
│
└── prod/
└── terraform.tfvars

ansible/
│
├── inventory.ini
├── site.yml
├── roles/
│ ├── nginx/
│ ├── mysql/
│ ├── postgres/
│ ├── docker/
│ └── logrotate
```
---
#  Terraform Deployment

 Initialize:
```bash
terraform init
```
Plan (Production)
```bash
terraform plan -var-file=prod/terraform.tfvars
```
Apply
```bash
terraform apply -var-file=prod/terraform.tfvars
```
---

## Ansible Configuration

Local machine acts as Ansible controller.

# Services Installed

1.Nginx

- Installed via apt
- Enabled & started

2. MySQL

- Database created
- User created
- Privileges granted
- Sample data seeded

3. PostgreSQL

Database created
User created
Permissions granted
Sample data seeded

4. Docker & Swarm

Docker installed
Swarm initialized

---

 ## Monitoring Stack
 Prometheus:
Collects system and database metrics
Configured targets:
     - node_exporter
     - mysqld_exporter
     - postgres_exporter

# Grafana Dashboards
MySQL Monitoring

- Uptime
- Connections
- Queries
- Buffer pool stats

PostgreSQL Monitoring

- Active connections
- Transactions
- Cache hit ratio
- Database size
- CPU & memory

System Monitoring

- CPU
- Memory
- Disk
- Network
---

# Log Locations

Service	Log Path
- MySQL	/var/log/mysql/
- PostgreSQL	/var/log/postgresql/
- Nginx	/var/log/nginx/
- System	/var/log/syslog

# Log Rotation
Log rotation prevents log files from growing indefinitely by:

- Rotating logs daily
- Compressing old logs
- Retaining limited backups
---