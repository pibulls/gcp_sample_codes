resource "google_compute_image" "sach_gce_image" {
  name          = "sach-gce-image"
  #source_instance = google_compute_instance.sach-gce.self_link
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

resource "google_compute_image" "sach_gce2_image" {
  name          = "sach-gce2-image"
 # source_instance = google_compute_instance.sach-gce-2.self_link
}

resource "google_compute_image" "sach_gce1_image" {
  name          = "sach-gce1-image"
  #source_instance = google_compute_instance.sach-gce-1.self_link
}