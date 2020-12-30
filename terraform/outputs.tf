output "master_ip" {
  value = aws_instance.cb_k8s_master.private_ip
}

output "node_ip" {
  value = aws_instance.cb_k8s_node.private_ip
}

