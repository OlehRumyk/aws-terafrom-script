#=====================================================================================
# Create key pair in EC2. A key pair is used to control login access to EC2 instances.
#=====================================================================================

resource aws_key_pair create {
  key_name   = local.prefix
  public_key = var.aws_key_pair
}
