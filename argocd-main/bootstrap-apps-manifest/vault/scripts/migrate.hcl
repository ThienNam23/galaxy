storage_source "file" {
  path = "/vault/data"
}

storage_destination "raft" {
  path = "/tmp/raft-data"
}

cluster_addr="https://vault-raft-0.vault-raft-internal:8201"