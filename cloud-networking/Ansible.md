# Ansible

## Vocabulary - TODO Go through book
* playbook
* task
* inventory
* roles
* files

## Common commands - TODO: Explain what each are doing
* `ansible-playbook`
  * `ansible-playbook -i <inventory_file> <yml_file>`
* `ansible-inventory`
  * `ansible-inventory -i <inventory> --list` - TODO: What is this?
* `ansible`
  * `ansible -i <inventory> all -m ping` - TODO: What is this?
  * `ansible -i <inventory> all -m setup [-u <username>]` - TODO: What is this?
* `ansible-vault`
  * TODO: Fill this in with encrypt, decrypt, password in file, and password in terminal
* Flags
  * -v, -vv, -vvv
    * TODO: What are the differences?
  * --skip-tags=<tag_to_skip>
  * --tags=<tag_to_run>
* TODO: What is difference between `ansible-playbook`, `ansible-inventory`, and `ansible` as applications

## Common task keywords:
* name - name of task for easy reference
* shell - run common on shell
* register - variable name to register output to as dictionary, common keys <TODO: FILL IN stdout, etc>
* failed_when - fail the task on this condition
* changed_when - TODO: What is this?
* no_log - should logging be output to screen, default true
* become - TODO: What is this?, guessing it is `sudo`
* 

## Task Examples:
* Shell Command, Register, Failure check, 
  ```
  - name: Quick Error
    shell: pwd
    register: what_what
    failed_when:
    - 1+1 == 2
    changed_when: "'OK' in previous_register.stdout"
    no_log: false
    ignore_errors: false
  ```
* TODO: Example needed of `debug`, `vars`, loop, `set_fact`, `when`, `with_items`, `become`, `changed_when`

## String Parsing
* TODO: So many examples needed, some available in references
* what does "first" do?
  * "{{ stuff.stdout | regex_search(regex_parse_str, '\\1') | first }}"

## References
* https://docs.ansible.com/ansible/2.10/user_guide/playbooks_filters.html#searching-strings-with-regular-expressions
* https://www.jeffgeerling.com/blog/2017/adding-strings-array-ansible