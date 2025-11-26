vpc_cidr = "10.0.0.0/16"

web_subnet_cidr = "10.0.0.0/24"
web_subnet_az   = "ap-south-1a"

app_subnet_cidr = "10.0.1.0/24"
app_subnet_az   = "ap-south-1a"

db_subnet_cidr = "10.0.2.0/24"
db_subnet_az   = "ap-south-1a"

region = "ap-south-1"

vpc_info = {
  name                 = "from-tf"
  cidr                 = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {                    # ← YE ADD KARO
    Name = "from-tf"
    Env  = "Dev"
  }
}

  description          = "web subnet information"



web_subnet_info = {
  az   = "ap-south-1a"
  cidr = "10.0.1.0/24"
  tags = {
    Name = "Web-subnet"
    
  }
}


app_subnet_info = {
  az   = "ap-south-1a"
  cidr = "10.0.2.0/24"
  tags = {
    Name = "app-subnet"
    
  }
}

db_subnet_info = {
  az   = "ap-south-1a"
  cidr = "10.0.3.0/24"
  tags = {
    Name = "db"
    Env  = "dev"
  }
}