### Ansible-scripts
Ansible provisioning for this environment

install ansible, open terminal on MAC

```
brew install ansible

```

Ansible configuration locally for `MAC`


```
mkdir /etc/ansible
cd /etc/ansible
echo -e "# [webserver]\n# 52.80.123.251 ansible_ssh_private_key_file=~/.ssh/aws_pem_key.pem" | tee /etc/ansible/hosts

echo -e "[defaults]\nhostfile = inventory " | sudo tee -a ansible.cfg
echo -e "sudo_user      = root" | sudo tee -a ansible.cfg
echo -e "private_key_file =~/.ssh/aws_pem_key.pem" | sudo tee -a ansible.cfg

cd ansible_web_db/ansible/ansible_web
# change the ip address in the inventory/hosts files for the [webServer]
ansible-playbook -i inventory web_provision.yml  # for the web provisioning

cd ansible_web_db/ansible/ansible_db
# change the ip address in the inventory/hosts files for the [dbServer]
ansible-playbook -i inventory deb_provision.yml  # for the deb provisioning

```
