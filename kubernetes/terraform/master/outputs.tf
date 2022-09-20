output "all_k8s-master_instances_external_IPs" {
  value = yandex_compute_instance.k8s-master[*].network_interface.0.nat_ip_address
}
