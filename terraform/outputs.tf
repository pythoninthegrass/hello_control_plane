data "cpln_gvc" "gvc" {
  name = var.gvc
}

output "gvc_id" {
  value = data.cpln_gvc.gvc.id
}

output "gvc_locations" {
  value = data.cpln_gvc.gvc.locations
}

output "workload_id" {
  value = cpln_workload.httpbin-example-workload-resource.id
}

output "workload_self_link" {
  value = cpln_workload.httpbin-example-workload-resource.self_link
}

output "workload_status" {
  value = cpln_workload.httpbin-example-workload-resource.status
}

output "workload_cpln_id" {
  value = cpln_workload.httpbin-example-workload-resource.cpln_id
}
