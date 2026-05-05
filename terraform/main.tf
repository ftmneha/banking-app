provider "kubernetes" {
  config_path = "C:\\ProgramData\\Jenkins\\.jenkins\\config"
}

resource "kubernetes_deployment" "banking_app" {
  metadata {
    name = "banking-app"
    labels = {
      app = "banking"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "banking"
      }
    }

    template {
      metadata {
        labels = {
          app = "banking"
        }
      }

      spec {
        container {
          name  = "banking-container"
          image = "banking-app:latest"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "banking_service" {
  metadata {
    name = "banking-service"
  }

  spec {
    selector = {
      app = "banking"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }
}