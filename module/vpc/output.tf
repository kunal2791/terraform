#output "all_subnets_ids" {
#  value = "${join(",", aws_subnet.private_subnet.*.id,aws_subnet.public_subnet.*.id)}"
#}

output "public_subnet_ids" {
  value = "${aws_subnet.public_subnet.*.id}"
}

output "private_subnet_ids" {
  value = "${aws_subnet.private_subnet.*.id}"
}
