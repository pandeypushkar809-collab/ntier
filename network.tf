# vpc


resource "aws_vpc" "base" {
  cidr_block           = "192.168.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "from-tf"
    Env  = "dev"

  }


}

resource "aws_subnet" "web" {
  vpc_id            = aws_vpc.base.id # Implicity dependency
  availability_zone = "ap-south-1a"
  cidr_block        = "192.168.1.0/24"
  tags = { Name = "web"
    Env = "dev"
  }
  # explicit dependency
  depends_on = [aws_vpc.base]

}


resource "aws_subnet" "app" {
  vpc_id            = aws_vpc.base.id # Implicity dependency
  availability_zone = "ap-south-1a"
  cidr_block        = "192.168.0.0/24"
  tags = { Name = "app"
    Env = "dev"
  }
  # explicit dependency
  depends_on = [aws_vpc.base]

}

resource "aws_subnet" "db" {
  vpc_id            = aws_vpc.base.id # Implicity dependency
  availability_zone = "ap-south-1a"
  cidr_block        = "192.168.2.0/24"
  tags = { Name = "db"
    Env = "dev"
  }
  # explicit dependency
  depends_on = [aws_vpc.base]

}

