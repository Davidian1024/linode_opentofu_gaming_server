# linode_opentofu_gaming_server

Deploys and configures an Ubuntu 24.04 Linode instance using OpenTofu.  Currently only setup to run the Sons of the Forest dedicated server.  The possibility of running other dedicated servers is imagined.

Was created on an Ubuntu 22.04.4 machine with OpenTofu v1.7.2.

Expects the following environment variables to be set:

```
export TF_VAR_server_admin_steamid='#################'  # Players whose SteamIDs are provided will be granted game server admin rights.  Separated by newlines.

export TF_VAR_server_name='linode_opentofu_gaming_server'  # The name that will be displayed in the dedicated server list.

export TF_VAR_password='the_game_password'  # The password players will have to enter in order to access the server.

export TF_VAR_root_pass='instance_root_password'  # A password for accessing the Linode instance.

export TF_VAR_authorized_keys='ssh-rsa ...'  # SSH public keys that will allow root access.  Separated by newlines.

export LINODE_TOKEN='#################'  # A Linode API token that will allow OpenTofu to connect to Linode and deploy the resources.

export TF_VAR_admin_ssh_ip='###.###.###.###'  # IP address from which SSH connections will be allowed through firewall.
```