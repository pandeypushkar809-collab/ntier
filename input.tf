variable "vpc_cidr" {
  type        = string
  description = "vpc_cidr"
  default     = "192.168.0.0/16"
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


variable "app_subnet_cidr" {
  type        = string
  description = "CIDR block for the App subnet"
  default     = "192.168.1.0/24"
}

variable "db_subnet_cidr" {
  type        = string
  description = "CIDR block for the DB subnet"
  default     = "192.168.2.0/24"
}

variable "app_subnet_name" {
  type        = string
  description = "Name tag for the App subnet"
  default     = "app-subnet"
}

variable "db_subnet_name" {
  type        = string
  description = "Name tag for the DB subnet"
  default     = "db-subnet"
}
variable "app_subnet_az" {
  type        = string
  description = "AZ for App subnet"
  default     = "ap-south-1a"
}

variable "db_subnet_az" {
  type        = string
  description = "AZ for DB subnet"
  default     = "ap-south-1a"
}
