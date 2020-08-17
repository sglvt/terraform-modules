resource "aws_autoscaling_group" "asg" {
  vpc_zone_identifier = var.subnet_ids
  min_size = var.min_size
  max_size = var.max_size

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = var.launch_template
        version = "$Latest"
      }

    }

    instances_distribution {
      on_demand_base_capacity = var.on_demand_base_capacity
      on_demand_percentage_above_base_capacity = var.on_demand_percentage_above_base_capacity
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy = var.spot_allocation_strategy
      spot_instance_pools = var.spot_instance_pools
      spot_max_price = var.spot_max_price
    }
  }

  lifecycle {
    create_before_destroy = true
  }

  dynamic "tag" {
    for_each = var.additional_tags

    content {
      key = tag.key
      value = tag.value
      propagate_at_launch = true
    }

  }

}