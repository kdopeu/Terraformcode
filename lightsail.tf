resource "aws_lightsail_instance" "example_instance" {
  name              = "example-instance"
  availability_zone = "us-east-1a" # Change this to your desired availability zone
  blueprint_id      = "amazon_linux_2" # Change this to your desired blueprint

  bundle_id = "micro_2_0" # Change this to your desired instance type

  user_data = <<-EOF
    #!/bin/bash
    sudo yum install httpd -y
    sudo systemctl start httpd
    sudo systemctl enable httpd
    sudo echo "<h1>This Server is created using Terraform </h1>" >> /var/www/html/index.html
  EOF
}
