# packer {
#   required_plugins {
#     amazon = {
#       version = ">= 1.2.8"
#       source  = "github.com/hashicorp/amazon"
#     }
#   }
# }

# source "amazon-ebs" "ubuntu" {
#   ami_name      = "ubuntu-phase7-group1S5"
#   instance_type = "t2.medium"
#   region        = "us-east-1"

#   source_ami_filter {
#     filters = {
#       name                = "ubuntu/images/*ubuntu-jammy-22.04-amd64-server-*"
#       root-device-type    = "ebs"
#       virtualization-type = "hvm"
#     }
#     most_recent = true
#     owners      = ["099720109477"]
#   }
#   ssh_username = "ubuntu"
# }

# build {
#   name    = "ubuntu-phase7-group1S5"
#   sources = [
#     "source.amazon-ebs.ubuntu"
#   ]
# }

# provisioner "file" {
#   source      = "./user.sh"
#   destination = "/etc/user.sh"
# }

# provisioner "shell" {
#   inline = [
#     "sudo chmod +x /etc/user.sh"
#     "sudo bash /etc/user.sh"
    
#   ]
# }


# packer {
#   required_plugins {
#     amazon = {
#       version = ">= 1.2.8"
#       source  = "github.com/hashicorp/amazon"
#     }
#   }
# }

# source "amazon-ebs" "ubuntu" {
#   ami_name      = "ubuntu-phase7-group1S5"
#   instance_type = "t2.medium"
#   region        = "us-east-1"


# source_ami_filter {
    
#   filters = {
#     name                = "ubuntu/images/*ubuntu-jammy-22.04-amd64-server-*"
#     root-device-type    = "ebs"
#     virtualization-type = "hvm"
#     most_recent         = true
#     owners              = ["099720109477"]
#   }

#   ssh_username = "ubuntu"
#   }
# }

# build {
#   name    = "ubuntu-phase7-group1S5"
#   sources = ["source.amazon-ebs.ubuntu"]

#   provisioner "file" {
#     source      = "./user.sh"
#     destination = "/etc/user.sh"
#   }

#   provisioner "shell" {
#     inline = [
#       "sudo chmod +x /etc/user.sh",
#       "sudo bash /etc/user.sh"
#     ]
#   }
# }

packer {
  required_version = ">= 1.5.0"
  required_plugins {
    amazon = {
      version = "1.2.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}


source "amazon-ebs" "ubuntu" {
  ami_name      = "ubuntu-phase7-group1S5"
  instance_type = "t2.medium"
  region        = "us-east-1"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]  # Canonical
  }
  ssh_username = "ubuntu"
  tags = {
    "Name"        = "ubuntu-phase7-group1S5"
    "Created-by"  = "phase7-group1S5"
  }
}

build {
  name = "ubuntu-phase7-group1S5"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
  provisioner "file" {
    source      = "./user.sh"
    destination = "/tmp/user.sh"
  }



  provisioner "shell" {
    inline = [
      "sudo chmod +x /tmp/user.sh",
      "sudo bash /tmp/user.sh"
    ]
  }


  post-processor "manifest" {
  output = "manifest.json"
}
}