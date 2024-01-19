/**
 * Made to resemble:
 * gcloud compute instance-groups managed set-autoscaling example-managed-instance-group \
 *  --max-num-replicas 30 \
 *  --target-cpu-utilization 0.80 \
 *  --cool-down-period 120
 */

# [START compute_zonal_mig_set_autoscaling]
# [START compute_zonal_mig_set_autoscaling]
resource "google_compute_autoscaler" "default" {
  name   = "example-autoscaler"
  zone   = "us-central1-f"
  target = google_compute_instance_group_manager.default.id

  autoscaling_policy {
    max_replicas    = 30
    min_replicas    = 0
    cooldown_period = 120

    cpu_utilization {
      target = 0.80
    }
  }
}
# [END compute_zonal_mig_set_autoscaling]

resource "google_compute_instance_template" "default" {
  machine_type = "e2-medium"
  disk {
    source_image = "debian-cloud/debian-11"
  }
  network_interface {
    network = "default"
  }
}

resource "google_compute_instance_group_manager" "default" {
  name               = "sachita-managed-instance-group"
  zone               = "us-central1-f"
  base_instance_name = "sachita-instance"

  version {
    instance_template = google_compute_instance_template.default.id
  }
}
# [END compute_zonal_mig_set_autoscaling]