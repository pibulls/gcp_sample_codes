provider "google" {
  #credentials = file("<path-to-your-service-account-key.json>")
  project     = "data-engineering-sachita" #Replace with your project id
  region      = "us-east1"
}

resource "google_compute_instance" "sach-gce" {
  name         = "sach-gce"
  machine_type = "e2-micro"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size  = 10
      type  = "pd-ssd"
    }
  }

  scheduling {
    preemptible  = false
    on_host_maintenance = "MIGRATE"
    automatic_restart    = true
  }

  shielded_instance_config {
    enable_secure_boot          = false
    enable_integrity_monitoring = false
  }

  network_interface {
    network = "projects/vpc-host-production-sach/global/networks/vpc-prod-shared"
    subnetwork = "projects/vpc-host-production-sach/regions/us-east1/subnetworks/subnet-prod-2"
  }

  # Specify the shared VPC host project here
  #shared_vpc_host = "projects/data-engineering-sachita"
  
  #service_account {
   # scopes = ["default"]
 # }

 # metadata = {
 #   ssh-keys = "your-ssh-public-key"
 # }
 
 metadata = {
    enable-oslogin = "TRUE"
  }

  #access_config {
    # Optional: You can specify external IPs or leave it empty for ephemeral IPs
 # }
}

#resource "google_compute_firewall" "allow_lb_health_checks" {
 # name    = "allow-lb-health-checks"
 # network = "projects/vpc-host-production-sach-sach/global/networks/vpc-prod-shared"

 # allow {
 #   protocol = "icmp"
 # }

#  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
#  target_tags   = ["sach-gce"]
#}
resource "google_compute_instance" "sach-gce-2" {
  name         = "sach-gce-2"
  machine_type = "e2-micro"
  zone         = "us-east1-c"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size  = 10
      type  = "pd-ssd"
    }
  }

  scheduling {
    preemptible  = false
    on_host_maintenance = "MIGRATE"
    automatic_restart    = true
  }

  shielded_instance_config {
    enable_secure_boot          = false
    enable_integrity_monitoring = false
  }

  network_interface {
    network = "projects/vpc-host-production-sach/global/networks/vpc-prod-shared"
    subnetwork = "projects/vpc-host-production-sach/regions/us-east1/subnetworks/subnet-prod-2"
  }

  # Specify the shared VPC host project here
  #shared_vpc_host = "projects/data-engineering-sachita"
  
  #service_account {
   # scopes = ["default"]
 # }

 # metadata = {
 #   ssh-keys = "your-ssh-public-key"
 # }
 
 metadata = {
    enable-oslogin = "TRUE"
  }

  #access_config {
    # Optional: You can specify external IPs or leave it empty for ephemeral IPs
 # }
}
resource "google_compute_instance" "sach-gce-1" {
  name         = "sach-gce-1"
  machine_type = "e2-micro"
  zone         = "us-east1-d"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size  = 10
      type  = "pd-ssd"
    }
  }

  scheduling {
    preemptible  = false
    on_host_maintenance = "MIGRATE"
    automatic_restart    = true
  }

  shielded_instance_config {
    enable_secure_boot          = false
    enable_integrity_monitoring = false
  }

  network_interface {
    network = "projects/vpc-host-production-sach/global/networks/vpc-prod-shared"
    subnetwork = "projects/vpc-host-production-sach/regions/us-east1/subnetworks/subnet-prod-2"
  }

  # Specify the shared VPC host project here
  #shared_vpc_host = "projects/data-engineering-sachita"
  
  #service_account {
   # scopes = ["default"]
 # }

 # metadata = {
 #   ssh-keys = "your-ssh-public-key"
 # }
 
 metadata = {
    enable-oslogin = "TRUE"
  }

  #access_config {
    # Optional: You can specify external IPs or leave it empty for ephemeral IPs
 # }
}
