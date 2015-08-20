#!/bin/bash
# Execute ansible install group of tasks
ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory --user=vagrant --private-key=.vagrant/machines/default/virtualbox/private_key site.yml --tags install -vvvv --extra-vars="install=true"
