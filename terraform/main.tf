resource "google_project_service" "project_services" {
  for_each           = toset(var.services)
  project            = var.project_id
  service            = each.value
  disable_on_destroy = false
}

resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false

}

resource "google_compute_instance" "vm_instance" {
  name         = "vm-instance-1"
  project      = var.project_id
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network    = module.vpc.vpc_network_id
    subnetwork = module.vpc.vpc_subnetwork_id

    dynamic "access_config" {
      for_each = var.vm_assign_public_ip ? [1] : []
      content {}
    }
  }

  depends_on = [module.vpc]
}


resource "google_storage_bucket" "bucket" {
  name          = "tf-bucket-${random_string.suffix.result}"
  location      = var.region
  force_destroy = false

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = false
  }
}

module "vpc" {
  project_id               = var.project_id
  source                   = "../modules/vpc"
  routing_mode             = "REGIONAL"
  region                   = var.region
  private_ip_google_access = true
  zone                     = var.zone
  vpc_name                 = var.vpc_name
  vpc_subnetwork_name      = "subnet-1"
  subnets = [
    {
      name          = "subnet-1"
      ip_cidr_range = "10.0.1.0/24"
    }
  ]
}
