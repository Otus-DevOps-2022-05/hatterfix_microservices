output "all_docker-host_instances_external_IPs" {
  value = yandex_compute_instance.docker-host[*].network_interface.0.nat_ip_address
}
