# multipass-images
My custom [multipass](https://multipass.run/) images for local development and testing use

## Nomad
Create a local nomad cluster. These images also include consul. Currently only supports one server and multiple clients.
Steps to run:

```
multipass launch https://img.taypo.com/nomad-server.img --name NomadServer
```

Get the IP address of the server from `multipass list`. Create the following file, and replace the IP with the IP of the server you just created.

cloudinit.yml:
```yaml
write_files:
-   content: |
        retry_join = ["10.215.117.75"]
    path: /etc/consul.d/join.hcl
```

Now you can launch as many clients as you want:
```
multipass launch https://img.taypo.com/nomad-client.img --name NomadClient1 --cloud-init cloudinit.yml
multipass launch https://img.taypo.com/nomad-client.img --name NomadClient2 --cloud-init cloudinit.yml
multipass launch https://img.taypo.com/nomad-client.img --name NomadClient3 --cloud-init cloudinit.yml

```
Consul UI will be running on port 8500 of the server. And Nomad UI on 4646.


