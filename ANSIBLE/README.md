# Ansible Overview
This directory contains Ansible playbooks and roles for automating the deployment and management of various systems and applications. Ansible is an open-source automation tool that simplifies IT tasks such as configuration management, application deployment, and task automation.

# Getting Started with Ansible
1. Install Ansible on your control machine using wsl in windows bcoz ansible is not supported natively on windows.
    ```bash
    sudo apt update
    sudo apt upgrade -y
    sudo apt install ansible
    ansible --version
    ```
2. inventry:
    Ansible uses an inventory file to define the hosts and groups of hosts on which tasks will be executed. The default inventory file is located at `/etc/ansible/hosts`, but you can create your own inventory file in this directory.
    
    Example inventory file (`inventory.ini`):
    ```ini
    [webservers]
    web1.example.com
    web2.example.com
    
    [dbservers]
    db1.example.com
    db2.example.com
    ```
3. basic inventry
    ```bash
    touch hosts
    nano hosts
    ```
- in hosts file add below lines
    ```ini
    [myservers]
    localhost ansible_connection=local
    ```
    ```bash
    ansible -i hosts myservers -m ping
    ```
4. playbook
    ```bash
    touch myplaybook.yml
    nano myplaybook.yml
    ```
- in myplaybook.yml file add below lines
    ```yaml
    ---
    - name:create a ansible file
        hosts: myservers
        tasks:
            - name: Create a file using Ansible
            file:
              path: "{{ ansible_env.HOME }}/ansible_test_file.txt"
              state: touch
              mode: '0644'
    ```
    ```bash
    ansible-playbook -i hosts myplaybook.yml
    ```
- explaination of above playbook:
    - `name`: A descriptive name for the playbook.
    - `hosts`: Specifies the target hosts or groups defined in the inventory file.
    - `tasks`: A list of tasks to be executed on the target hosts.
    - `file`: The Ansible module used to manage files and directories.
    - `path`: The path where the file will be created. Here, it uses a variable to get the home directory of the user.
    - `state`: Specifies the desired state of the file. In this case, `touch` creates an empty file if it doesn't exist.
    - `mode`: Sets the file permissions.
    - `ansible_env.HOME`: A built-in Ansible variable that retrieves the home directory of the user on the target host.
    - `0644`: File permission setting that allows the owner to read and write, while others can only read.
5. Running Playbooks
*syntax*:
```bash
ansible-playbook -i <inventory_file> <playbook_file>
```

## varibales and loops

```yaml
---
- name: Create multiple files using Ansible
  hosts: myservers
  vars:
    file_names:
      - file1.txt
      - file2.txt
      - file3.txt
  tasks:
    - name: Create files from the list
      file:
        path: "{{ ansible_env.HOME }}/{{ item }}"
        state: touch
        mode: '0644'
        loop: "{{ file_names }}"    
```
- for variable use vars keyword and use {{ }} to call the variable
- for loop use loop keyword

# questions
1. ansible is installed in local machine not in remote machine.