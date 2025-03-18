resource "cpln_workload" "httpbin-example-workload-resource" {
  name                 = "httpbin-example"
  description          = "httpbin-example"
  gvc                  = var.gvc
  type                 = "serverless"
  support_dynamic_tags = false
  container {
    name   = "httpbin"
    image  = "kennethreitz/httpbin"
    cpu    = "50m"
    memory = "128Mi"
    ports {
      number   = 80
      protocol = "http"
    }
  }
  options {
    timeout_seconds = 5
    capacity_ai     = true
    debug           = false
    suspend         = false
    autoscaling {
      metric              = "concurrency"
      target              = 100
      min_scale           = 1
      max_scale           = 3
      scale_to_zero_delay = 300
      max_concurrency     = 1000
    }
  }
  firewall_spec {
    external {
      inbound_allow_cidr      = ["0.0.0.0/0"]
      outbound_allow_hostname = []
      outbound_allow_cidr     = ["0.0.0.0/0"]
    }
    internal {
      inbound_allow_type     = "none"
      inbound_allow_workload = []
    }
  }
  load_balancer {
    direct {
      enabled = false
    }
  }
}
