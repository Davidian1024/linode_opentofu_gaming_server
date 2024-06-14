resource "linode_vpc" "gaming_server" {
  label  = "gaming-server-vpc"
  region = "us-ord"
}

resource "linode_vpc_subnet" "gaming_server" {
  vpc_id = linode_vpc.gaming_server.id
  label  = "gaming-server-subnet-1"
  ipv4   = "10.0.0.0/24"
}

resource "linode_firewall" "gaming_server" {
  label = "gaming-server-firewall"

  inbound {
    label    = "accept-inbound-SSH"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "22"
    ipv4     = ["75.76.41.228/32"]
  }

  inbound {
    label    = "sotf_game_port"
    action   = "ACCEPT"
    protocol = "UDP"
    ports    = "8766"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "sotf_query_port"
    action   = "ACCEPT"
    protocol = "UDP"
    ports    = "27016"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "sotf_blob_sync_port"
    action   = "ACCEPT"
    protocol = "UDP"
    ports    = "9700"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound_policy = "DROP"

  outbound_policy = "ACCEPT"

  linodes = [linode_instance.gaming_server.id]
}
