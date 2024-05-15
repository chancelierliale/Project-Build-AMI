
##################################################################################
#                           created 3 private subnet                                                     #
#                                                                                #
##################################################################################

resource "aws_subnet" "private-subnet-db-01" {
 depends_on = [
    aws_vpc.main
  ]
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnets_db[0]
  availability_zone = var.aws_availability_zones[0]
  tags = merge(var.common_tags, {
    Name                                        = format("%s-%s-%s-vpc-private-subnet-db-01", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = var.shared
    },
  )
}

resource "aws_subnet" "private-subnet-db-02" {
  depends_on = [
    aws_vpc.main
  ]
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnets_db[1]
  availability_zone = var.aws_availability_zones[1]
  tags = merge(var.common_tags, {
    Name                                        = format("%s-%s-%s-vpc-private-subnet-db-02", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = var.shared
    },
  )
}




resource "aws_subnet" "private-subnet-db-03" {
  depends_on = [
    aws_vpc.main
  ]
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnets_db[2]
  availability_zone = var.aws_availability_zones[2]
  tags = merge(var.common_tags, {
    Name                                        = format("%s-%s-%s-vpc-private-subnet-db-02", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = var.shared
    },
  )
}



##################################################################################
#                           created 3 public subnet                                                     #
#                                                                                #
##################################################################################

resource "aws_subnet" "public-subnet-01" {
  depends_on = [
    aws_vpc.main
  ]
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public[0]
  availability_zone       = var.aws_availability_zones[0]
  tags = merge(var.common_tags, {
    Name                                        = format("%s-%s-%s-vpc-public-subnet-01", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = var.shared
    },
  )
}

resource "aws_subnet" "public-subnet-02" {
  depends_on = [
    aws_vpc.main
  ]
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public[1]
  availability_zone       = var.aws_availability_zones[1]
  tags = merge(var.common_tags, {
    Name                                        = format("%s-%s-%s-vpc-public-subnet-02", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = var.shared
    },
  )
}



resource "aws_subnet" "public-subnet-03" {
  depends_on = [
    aws_vpc.main
  ]
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public[2]
  availability_zone       = var.aws_availability_zones[2]
  tags = merge(var.common_tags, {
    Name                                        = format("%s-%s-%s-vpc-public-subnet-02", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
     "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = var.shared
    },
  )
}