resource "aws_instance" "aws_producer_instance" {
  provider = aws.se
  ami           = var.se_ami
  instance_type = var.instance_type
  associate_public_ip_address = "true"
  key_name = var.se_key
  iam_instance_profile = "_ec2_admin"
  connection {
    type        = "ssh"
    user        = "ec2-user" 
    private_key = file("../../seoul-key")
    host        = self.public_ip
  }
  provisioner "file" {
    source      = "producer.py" 
    destination = "/home/ec2-user/producer.py"
  }
  provisioner "remote-exec" {
    inline = [
      "echo 'producer.py uploaded successfully!'",
    ]
  }
  tags = {
    Name = "aws_producer_instance"
  }
  user_data = <<EOD
#!/bin/bash
yum update -y
yum groupinstall -y "Development Tools"
yum install -y python3-pip
sudo -u ec2-user pip install boto3
# python3 producer.py
EOD
}
