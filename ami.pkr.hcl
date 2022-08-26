packer {
  required_plugins {
    amazon = {
      version = ">= 1.1.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "packer-ami-aarsh" {
    ami_name = "packer-ami-aarsh"
    source_ami = "ami-0960ab670c8bb45f3"
    instance_type = "t3a.small"
    region = "us-east-2"
    ssh_username = "ubuntu"
}

build {
    sources = [
        "source.amazon-ebs.packer-ami-aarsh"
    ]

    provisioner "shell" {
        script = "./app.sh"
    }
}