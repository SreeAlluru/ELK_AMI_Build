packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ElasticSearch" {
  ami_name          = "ElasticSearch"
  instance_type     = "t3.small"
  region            = "eu-west-2"
  vpc_id            = "vpc-08d77654b681d306b"
  subnet_id         = "subnet-086bde3f82e7ae1fc"
  security_group_id = "sg-03709ccf75e69d631"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
  tags = {
    "Name" = "ElasticSearch"
  }
  deprecate_at          = timeadd(timestamp(), "8766h")
  force_deregister      = "true"
  force_delete_snapshot = "true"
}

build {
  name = "ElasticSearch"
  sources = [
    "source.amazon-ebs.ElasticSearch",
  ]
  #provisioner "ansible" {
  # playbook_file   = "./playbooks/webserver.yml"
  # extra_arguments = ["--extra-vars", "color=${var.bldeploy}"]

  # }
}

source "amazon-ebs" "Logstash" {
  ami_name          = "Logstash"
  instance_type     = "t3.small"
  region            = "eu-west-2"
  vpc_id            = "vpc-08d77654b681d306b"
  subnet_id         = "subnet-086bde3f82e7ae1fc"
  security_group_id = "sg-03709ccf75e69d631"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
  tags = {
    "Name" = "Logstash"
  }
  deprecate_at          = timeadd(timestamp(), "8766h")
  force_deregister      = "true"
  force_delete_snapshot = "true"
}

build {
  name = "Logstash"
  sources = [
    "source.amazon-ebs.Logstash",
  ]
  #provisioner "ansible" {
  # playbook_file   = "./playbooks/webserver.yml"
  # extra_arguments = ["--extra-vars", "color=${var.bldeploy}"]

  # }
}


source "amazon-ebs" "Kibana" {
  ami_name          = "Kibana"
  instance_type     = "t3.small"
  region            = "eu-west-2"
  vpc_id            = "vpc-08d77654b681d306b"
  subnet_id         = "subnet-086bde3f82e7ae1fc"
  security_group_id = "sg-03709ccf75e69d631"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
  tags = {
    "Name" = "Kibana"
  }
  deprecate_at          = timeadd(timestamp(), "8766h")
  force_deregister      = "true"
  force_delete_snapshot = "true"
}

build {
  name = "Kibana"
  sources = [
    "source.amazon-ebs.Kibana",
  ]
  #provisioner "ansible" {
  # playbook_file   = "./playbooks/webserver.yml"
  # extra_arguments = ["--extra-vars", "color=${var.bldeploy}"]

  # }
}
