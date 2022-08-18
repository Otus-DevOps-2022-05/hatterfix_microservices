output "all_gitlab-ci_instances_external_IPs" {
  value = yandex_compute_instance.gitlab-ci[*].network_interface.0.nat_ip_address
}
