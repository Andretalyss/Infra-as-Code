output "ec2_usa" {
    value = [
        "${aws_instance.usa.public_ip}",
        "${aws_instance.usa.instance_type}",
        "${aws_instance.usa.id}" 
    ]
}

output "ec2_sp" {
    value = [
        "${aws_instance.ec2_teste.public_ip}",
        "${aws_instance.ec2_teste.id}",
        "${aws_instance.ec2_teste.instance_type}"
    ]
}