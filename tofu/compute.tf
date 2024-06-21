resource "linode_instance" "gaming_server" {
  label           = "gaming_server"
  image           = "linode/ubuntu24.04"
  region          = "us-ord"
  type            = "g6-standard-2"
  authorized_keys = [var.authorized_keys]
  root_pass       = var.root_pass

  private_ip = true

  connection {
    type     = "ssh"
    user     = "root"
    password = var.root_pass
    host     = self.ip_address
    timeout  = "4m"
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Waiting for cloud-init to finish...'",
      "cloud-init status --format yaml --wait",
      "echo 'cloud-init finished.'",
      "echo 'Starting xvfb.service...'",
      "systemctl start xvfb.service",
      "echo 'xvfb.service started.'",
      "echo 'Starting sotfds.service...'",
      "systemctl start sotfds.service",
      "echo 'sotfds.service started.'",
    ]
    on_failure = continue
  }

  metadata {
    user_data = data.cloudinit_config.gaming_server.rendered
  }
}

data "template_file" "user_data_scripts" {
  template = file("${path.module}/user_data_scripts.cfg.tftpl")
  vars = {
    server_name          = var.server_name,
    password             = var.password,
    server_admin_steamid = var.server_admin_steamid,
  }
}

data "template_file" "run_scripts" {
  template = file("${path.module}/run-scripts.cfg.tftpl")
}

data "cloudinit_config" "gaming_server" {
  gzip          = false
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = data.template_file.user_data_scripts.rendered
  }

  part {
    content_type = "text/cloud-config"
    content      = data.template_file.run_scripts.rendered
  }
}