# Terraform files for preparing kubernetes cluster on OTC using kubespray


## Configuring k8s cluster

In order to build your k8s cluster you need to:
* have ansible and terraform installed on a VM with Ubuntu 16.04 
* run ssh-agent and add your key. It will further be used to login into the created VMs.
* provide your openstack credentials by editting parameter.tvars. The username should be the same as shown in the OTC console. You can not use the email or mobile number, which can also be used to login to the OTC web console. 
* eventually change values in varaibles.tf according to the comments in this file.

Edit variables.tf and set at least the following vars:
* dnszone - your registered Internet domain. The publicly resolvable cluster domain will be kube.{{dnszone}}.
* project - project name. It is used to prefix VM names. It should be unique among OTC as it is used to create names of VMs.
* public_key_file - the path to your ssh public key.
You can also set the variables specifying the networks to be used (in case of conficts with the existing ones):
* kube_service_addresses
* kube_pods_subnet
* vpc_subnet


The variables can also be provided interactively or set as command line args. For example:
```
terraform apply -var project=example_project -var email=joe@example.com ....
```

## Running
Build your k8s cluster issuing:
```
terraform init
terraform apply -var-file parameter.tvars
```

## Accessing your k8s cluster
After a successful build the public and private IPs of the k8s cluster master node are displayed.


## Destruction
Destroy the infrastructure with "terraform destroy" command. Use the same parameters as for the "terraform apply" command. 
```
terraform destroy -var-file ../parameter.tvars
```

## Example command flow 

### Prepare ssh 
```
eval `ssh-agent`
ssh-key
```
### Download the scripts
```
git clone https://github.com/darnik22/kube-centos-alone.git
```
### Configure k8s cluster
```
cd onedata-otc-tests
vi parameter.tvars
vi variables.tf
```
### Create the k8s cluster
```
terraform init
terraform apply -var-file ../parameter.tvars -var project=myproject -var dnszone=my.domain
```
Upon success the IP of the master node and VPN server are dysplayed in green color.
### Destroy the infrastructure
```
terraform destroy -var-file ../parameter.tvars

```

