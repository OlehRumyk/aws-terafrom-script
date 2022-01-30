
data aws_caller_identity current {}

data aws_ami linux {
  most_recent = true
  filter {
    name   = "name"
    values = [ "amzn2-ami-ecs-hvm-2.0.*-x86_64-ebs" ]
  }
  filter {
    name   = "state"
    values = ["available"]
  }
  owners = ["amazon"]
}

data template_file instance {
  template = file("${path.module}/files/ec2_config.sh.tpl")
  vars = {
    date_creation     = local.date_create
    os_type           = data.aws_ami.linux.platform_details
    first_name        = var.your_first_name
    last_name         = var.your_last_name
    account_id        = data.aws_caller_identity.current.account_id
  }

  depends_on = [
    data.aws_ami.linux
  ]
}
