output "vpc_network_id" {
  description = "ID (self_link) da VPC."
  value       = google_compute_network.vpc_network.id
}

output "vpc_subnetwork_id" {
  description = "ID (self_link) da primeira sub-rede."
  value       = length(google_compute_subnetwork.vpc_subnetwork) > 0 ? google_compute_subnetwork.vpc_subnetwork[0].id : null
}
