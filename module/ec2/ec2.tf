##Web Instance
resource "aws_instance" "bastion" {
  ami       = var.ami
  subnet_id = var.public_subnet_ids[0]
  vpc_security_group_ids = [
    var.internal_sg_id,
    var.operation_sg_1_id,
    var.operation_sg_2_id,
    var.operation_sg_3_id
  ]
  key_name      = aws_key_pair.key.id
  instance_type = var.instance_type
  root_block_device {
    volume_type = var.volume_type
    volume_size = var.volume_size
  }
  user_data = file("${path.module}/install_kubectl_eksctl.sh")

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["env"]}-bastion"
  }
}

##Elastic IP
resource "aws_eip" "eip_bastion" {
  vpc      = true
  instance = aws_instance.bastion.id

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["env"]}-bastion-eip"
  }
}

##Key Pair
resource "aws_key_pair" "key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}