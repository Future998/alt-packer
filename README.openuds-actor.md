# OpenUDS Actor instructions

## Depersonalization

Do not forget, if you decide to supplement the existing virtual machine template in any way, then you should perform depersonalization again.

### The user to connect to the actor

By default, a test user is used to connect.

### Adding additional steps

If you want to perform additional steps, you have two options:

1. Add additional actions to the script `scripts/steps/setup_openuds_actor`.
2. Create an additional script in `scripts/steps/`, then add it to `scripts/vm_setup`.

For example, let's add chromium downloads:

1\. Write a separate script `scripts/steps/setup_chromium`:

```sh
#! /bin/sh
set -euo pipefail

echo "Install Chromium"

apt-get -y install chromium
```

2\. Add it to the file `scripts/vm_setup`:

```sh
	if test "${VM_TYPE}" == "openuds-actor"; then
		${STEP_DIR}/setup_remove_cdroms_repos
		${STEP_DIR}/setup_apt
		if test "${CLOUDINIT}" == "1"; then
			${STEP_DIR}/setup_cloudinit
		fi
		${STEP_DIR}/setup_agent
		${STEP_DIR}/setup_network
		${STEP_DIR}/setup_root
		${STEP_DIR}/setup_test_user
		${STEP_DIR}/setup_restore_sshd_config
		${STEP_DIR}/setup_ssh
		${STEP_DIR}/setup_prepare_new_instance
		${STEP_DIR}/setup_ansible
		${STEP_DIR}/setup_chromium
		${STEP_DIR}/setup_openuds_actor
	fi
```

After that, when building the golden image, chromium will be downloaded.

As you can see, it's very simple! You can quite simply supplement the actions that you need.