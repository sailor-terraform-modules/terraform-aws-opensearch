resource "aws_opensearch_domain" "domain" {
  domain_name     = var.domain_name
  engine_version  = var.engine_version
  access_policies = jsonencode(var.access_policies)



  auto_tune_options {
    desired_state       = "DISABLED"
    rollback_on_disable = "NO_ROLLBACK"

    # maintenance_schedule {
    #   cron_expression_for_recurrence = var.cron_expression_for_recurrence
    #   start_at                       = var.start_time

    #   duration {
    #     unit  = var.duration_unit
    #     value = var.duration_value
    #   }
    # }
  }
  advanced_security_options {
    enabled                        = false
    internal_user_database_enabled = false

    master_user_options {
      master_user_arn      = var.master_user_arn
      master_user_name     = var.master_user_name
      master_user_password = var.master_user_password
    }
  }


  cluster_config {
    instance_count           = var.instance_count
    instance_type            = var.instance_type
    dedicated_master_count   = var.dedicated_master_count
    dedicated_master_enabled = var.dedicated_master_enabled
    dedicated_master_type    = var.dedicated_master_type
    warm_enabled             = "false"
    warm_type                = var.warm_type
    warm_count               = var.warm_count
    zone_awareness_config {
      availability_zone_count = var.availability_zone_count
    }
    cold_storage_options {
      enabled = false
    }
  }

  ebs_options {
    ebs_enabled = true
    volume_size = var.ebs_volume_size
    volume_type = var.ebs_volume_type
  }

  dynamic "log_publishing_options" {
    for_each = var.log_eabled == true ? [1] : []
    content {
      cloudwatch_log_group_arn = var.cloudwatch_log_group_arn
      enabled                  = var.log_enabled
      log_type                 = var.log_type
    }

  }

  vpc_options {
    security_group_ids = var.security_ids
    subnet_ids         = var.subnet_ids
  }

  tags = {
    Domain = "TestDomain"
  }
}
resource "aws_secretsmanager_secret" "secret" {
  name       = var.secret_name
  kms_key_id = var.kms_key_arn
}

resource "aws_secretsmanager_secret_version" "secret_version" {
  secret_id     = aws_secretsmanager_secret.secret.id
  secret_string = <<EOF
   {
    "hostname": "${aws_opensearch_domain.domain.endpoint}"
    "username": "${var.master_username}",
    "password": "${var.master_password}"
   }
EOF
}