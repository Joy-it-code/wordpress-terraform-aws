resource "aws_efs_file_system" "wordpress_efs" {
  creation_token = "wordpress-efs"
  encrypted      = true

  tags = {
    Name = "wordpress-efs"
  }
}

resource "aws_security_group" "efs_sg" {
  name        = "efs-sg"
  description = "Allow NFS from EC2 instances"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    security_groups = [var.ec2_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_efs_mount_target" "efs_mount" {
  count          = length(var.private_subnet_ids)
  file_system_id = aws_efs_file_system.wordpress_efs.id
  subnet_id      = var.private_subnet_ids[count.index]
  security_groups = [aws_security_group.efs_sg.id]
}
