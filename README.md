# cpp_development_container
Container with C++ development tool chain base on Fedora

Credentials for the container:
username: developer
password: developer

## vscode
In vscode folder see vscode files to get started on configuring tasks, launch and settings for code completion

````
podman run -d --replace --name <CONTAINER_NAME>> --network <NETWORK_NAME> -v <LOCAL_FOLER_LOCATION>>:/home/developer/workspace:z -p 20202:22 -p 8081:8080 <NAME_OF_IMAGE>
````

## To connect via ssh through IDE, run the commands to generate keys from client
### In Powershell
````
ssh-keygen
#If keys are already generated, no need to replace them
type $env:USERPROFILE\.ssh\id_ed25519.pub | ssh localhost -p20202 "cat >> .ssh/authorized_keys"
````

### From WSL or Shell
````
ssh-keygen
#If keys are already generated, no need to replace them
ssh-copy-id -i ~/.ssh/id_ed25519.pub -p 20202 developer@localhost

#### Update/add containers.conf
In Fedora WSL, to get network working
````
sudo dnf install -y iptables
Update  /etc/containers/containers.conf with

[network]
firewall_driver="iptables"
