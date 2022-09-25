output "all_k8s-worker_instances_external_IPs" {
  value = yandex_compute_instance.k8s-worker[*].network_interface.0.nat_ip_address
}
