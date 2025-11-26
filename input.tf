variable "vpc_info" {
  description = "vpc information"
  type = object({
    name                 = string
    cidr                 = string
    enable_dns_hostnames = bool
    tags                 = map(string)

  })
  default = {
    name                 = "from-tf"
    cidr                 = "192.168.0.0/16"
    enable_dns_hostnames = true
    tags = {
      "name" = "from-tf"
      "Env"  = "Dev"
      region = "ap-south-1"
    }
  }
}

#### Web Subnet Variables 

variable "web_subnet_info" {
  type = object({
    cidr = string
    az   = string
    tags = map(string)
  })
  default = {
    az   = "ap-south-1a"
    cidr = "192.168.0.0/24"
    tags = {
      Name = "Web"
      Env  = "Dev"

    }

  }
  description = "web subnet information"
}



variable "web_subnet_cidr" {
  type        = string
  description = "web_subnet_cidr"
  default     = "192.168.0.0/24"
}




variable "web_subnet_az" {
  type        = string
  description = "web_subnet_az"
  default     = "ap-south-1a"
}


#### App Subnet Variables 


variable "app_subnet_info" {
  type = object({
    cidr = string
    az   = string
    tags = map(string)

  })
  default = {
    az   = "ap-south-1a"
    cidr = "192.168.1.0/24"
    tags = {
      "name" = "app"
      Env    = "Dev"
    }

  }

  description = "app subnet information"

}

#### Db Subnet Variables 

variable "db_subnet_info" {
  description = "db subnet information"
  type = object({
    cidr = string
    az   = string
    tags = map(string)
  })
  default = {
    az   = "ap-south-1a"
    cidr = "192.168.2.0/24"
    tags = {
      "name" = "db"
      "Env"  = "Dev"
      "key"  = "value"
    }
  }
}


variable "region" {
  type    = string
  default = "ap-south-1"

}







