
output "Controller node public address" {
  value = "${openstack_networking_floatingip_v2.kube-ctlr.0.address}"
}

output "kube-ctlr address" {
  value = "${openstack_compute_instance_v2.kube-ctlr.*.access_ip_v4}"
}

output "kube-work address" {
  value = "${openstack_compute_instance_v2.kube-work.*.access_ip_v4}"
}


