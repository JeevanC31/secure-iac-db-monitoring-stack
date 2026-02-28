region = "us-east-1"
env    = "prod"

vpc_cidr            = "10.0.0.0/16"
public_subnet_cidr  = "10.0.1.0/24"
private_subnet_cidr = "10.0.2.0/24"

az = "us-east-1a"

instance_type = "t3.micro"

ami = "ami-0c02fb55956c7d316" # Ubuntu 22.04 us-east-1

public_key_path = "~/.ssh/id_rsa.pub"

my_ip = "YOUR_PUBLIC_IP/32"