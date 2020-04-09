bind_addr = "{{ GetPrivateInterfaces | exclude \"name\" \"docker0\"  | attr \"address\" }}"
client_addr = "0.0.0.0"

server = true
bootstrap_expect = 1
ui = true

data_dir = "/data/consul"

log_file = "/var/log/consul.log"
