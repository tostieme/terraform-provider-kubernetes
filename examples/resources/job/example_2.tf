# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

resource "kubernetes_job" "demo" {
  metadata {
    name = "demo"
  }
  spec {
    template {
      metadata {}
      spec {
        container {
          name    = "pi"
          image   = "perl"
          command = ["perl", "-Mbignum=bpi", "-wle", "print bpi(2000)"]
        }
        restart_policy = "Never"
      }
    }
    backoff_limit = 4
  }
  wait_for_completion = true
  timeouts {
    create = "2m"
    update = "2m"
  }
}
