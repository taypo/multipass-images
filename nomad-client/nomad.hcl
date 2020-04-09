data_dir = "/data/nomad"

log_file = "/var/log/nomad.log"

client {
	enabled = true
}

telemetry {
  publish_allocation_metrics = true
  publish_node_metrics       = true
  prometheus_metrics         = true
  disable_hostname           = true
}
