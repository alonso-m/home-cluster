 local node_id=
    local node_username=
    local node_password=
    for var in "${!BOOTSTRAP_ANSIBLE_HOST_ADDR_@}"; do
        node_id=$(echo "${var}" | awk -F"_" '{print $5}')
        {
            node_username="BOOTSTRAP_ANSIBLE_SSH_USERNAME_${node_id}"
            node_password="BOOTSTRAP_ANSIBLE_SUDO_PASSWORD_${node_id}"
            node_hostname="BOOTSTRAP_ANSIBLE_HOSTNAME_${node_id}"
            printf "kind: Secret\n"
            printf "ansible_user: %s\n" "${!node_username}"
            printf "ansible_become_pass: %s\n" "${!node_password}"
        } > "${PROJECT_DIR}/provision/ansible/inventory/host_vars/${!node_hostname}.sops.yml"
        sops --encrypt --in-place "${PROJECT_DIR}/provision/ansible/inventory/host_vars/${!node_hostname}.sops.yml"
    done
