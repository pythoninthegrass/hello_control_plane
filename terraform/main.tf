resource "cpln_workload" "httpbin-example-workload-resource" {
  name                 = "httpbin-example"
  description          = "httpbin-example"
  gvc                  = var.gvc
  type                 = "standard"
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

  container {
    name   = "redis"
    image  = "redis:latest"
    cpu    = "100m"
    memory = "256Mi"
    ports {
      number   = var.redis_ports[0]
      protocol = "tcp"
    }
  }

  options {
    timeout_seconds = 5
    capacity_ai     = false
    debug           = false
    suspend         = false
    autoscaling {
      metric    = "cpu"
      target    = 70
      min_scale = 1
      max_scale = 3
    }
  }

  firewall_spec {
    external {
      inbound_allow_cidr  = [var.inbound_cidr]
      outbound_allow_cidr = ["0.0.0.0/0"]
      outbound_allow_port {
        protocol = "tcp"
        number   = var.redis_ports[0]
      }
      outbound_allow_port {
        protocol = "tcp"
        number   = var.redis_ports[1]
      }
      outbound_allow_hostname = []
    }
    internal {
      inbound_allow_type     = "same-gvc"
      inbound_allow_workload = []
    }
  }

  load_balancer {
    direct {
      enabled = false
    }
  }
}
