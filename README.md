# cpp_development_container
Container with C++ development tool chain base on Fedora

## vscode
In vscode folder see vscode files to get started on configuring tasks, launch and settings for code completion

````
podman run -d --replace --name <CONTAINER_NAME>> --network <NETWORK_NAME> -v <LOCAL_FOLER_LOCATION>>:/root/workspace:z -p 20202:22 -p 8080:8080 <NAME_OF_IMAGE>
````

### From WSL
````
ssh-keygen
#If keys are already generated, no need to replace them
cat ~/.ssh/id_ed25519.pub | podman exec -i dev_container sh -c "cat >> /root/.ssh/authorized_keys"
cat /mnt/c/Users/<WINDOWS_USER>/.ssh/id_ed25519.pub | podman exec -i dev_container sh -c "cat >> /root/.ssh/authorized_keys"
````

#### Update/add containers.conf
In Fedora WSL, to get network working
````
sudo dnf install -y iptables
Update  /etc/containers/containers.conf with
````
[network]
firewall_driver="iptables"
````
