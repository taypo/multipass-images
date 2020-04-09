bind_addr = "0.0.0.0"
data_dir = "/data/nomad"
log_file = "/var/log/nomad"

server {
	enabled = true
	bootstrap_expect = 1
}

telemetry {
  publish_allocation_metrics = true
  publish_node_metrics       = true
  prometheus_metrics         = true
  disable_hostname           = true
}
