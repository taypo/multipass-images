bind_addr = "{{ GetPrivateInterfaces | exclude \"name\" \"docker0\"  | attr \"address\" }}"
client_addr = "0.0.0.0"

# TODO make this external somehow
# retry_join = ["10.215.117.4"]

data_dir = "/data/consul"

log_file = "/var/log/consul.log"
