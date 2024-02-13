
# Security Group

resource "aws_security_group" "server_security_group" {
  name        = "${var.environment.name}-${var.ec2.name}-sg"
  vpc_id      = module.vpc.vpc_id
  description = "Security group for Jenkins"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

#   egress {
#     from_port       = 0
#     to_port         = 0
#     protocol        = "-1"
#     security_groups = [module.eks.node_security_group_id]
#   }

  tags = var.tags
}
