resource "aws_instance" "dev_Ins" {
	ami = "ami-0f69bc5520884278e"
	instance_type = "t2.micro"
	key_name = "KeyPairJan2022"
	subnet_id = "subnet-06e3260c3cdca46d6"
	vpc_security_group_ids = ["sg-0d23fef751c6f316a"]
	user_data = <<-EOF
		#!/bin/bash
		sudo apt-get update
		sudo apt-get install apache2 -y
		sudo sytemctl start apache2
		sudo systemctl enable apache2
	EOF
	tags = {
		Name = "Dev_Inst"
	}
}

output "dev_Ins_ip" { value = aws_instance.dev_Ins.public_ip }
