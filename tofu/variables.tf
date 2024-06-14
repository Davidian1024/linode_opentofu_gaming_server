variable "authorized_keys" {
  type        = string
  description = "The authorized_keys public SSH keys that will be installed into the instance, granting root access."
}

variable "root_pass" {
  type        = string
  description = "The password for the root account of the instance."
}

variable "password" {
  type        = string
  description = "Game server password."
}

variable "server_name" {
  type        = string
  description = "Game server name."
}

variable "server_admin_steamid" {
  type        = string
  description = "Steam ID of game server admin."
}

variable "admin_ssh_ip" {
  type        = string
  description = "IP address from which SSH connections will be allowed through firewall."
}
