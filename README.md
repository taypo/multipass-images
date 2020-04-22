# Custom Multipass Images
My custom [multipass](https://multipass.run/) images for local development and testing use. If you don't want to use the binaries, or you need to customize more, you can build the images yourself using [packer](https://packer.io/). 

Example:
```
cd nomad-client
packer build template.json
multipass launch file://$PWD/output-qemu/packer-qemu
```
A more detailed procedure can be found [in this post](https://discourse.ubuntu.com/t/building-multipass-images-with-packer/12361)


## Nomad
These two images can be used to create a local nomad cluster. They also include consul. Currently only supports one server and multiple clients.

Steps to run:

```
multipass launch https://img.taypo.com/nomad-server.img --name NomadServer
```

Get the IP address of the server from `multipass info NomadServer`. Create the following file, and replace the IP with the IP of the server you just created.

cloudinit.yml:
```yaml
write_files:
-   content: |
        retry_join = ["put your nomad server ip between these quotes"]
    path: /etc/consul.d/join.hcl
```

Now you can launch as many clients as you want:
```
multipass launch https://img.taypo.com/nomad-client.img --name NomadClient1 --cloud-init cloudinit.yml
multipass launch https://img.taypo.com/nomad-client.img --name NomadClient2 --cloud-init cloudinit.yml
multipass launch https://img.taypo.com/nomad-client.img --name NomadClient3 --cloud-init cloudinit.yml

```
Consul UI will be running on port 8500 of the server. And Nomad UI on 4646.


