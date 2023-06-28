variable "region" {
  type        = string
  description = "(optional) describe your region"
  default     = "us-east-2"
}

variable "domain_name" {
  type        = string
  description = " (Required) Name of the domain"

}

variable "access_policies" {
  type        = any
  description = " (Optional) IAM policy document specifying the access policies for the domain"
  default     = null
}

variable "master_user_arn" {
  type        = string
  default     = null
  description = "(Optional) ARN for the main user. Only specify if internal_user_database_enabled is not set or set to false."
}

variable "master_user_name" {
  type        = string
  default     = null
  description = " (Optional) Main user's username, which is stored in the Amazon Elasticsearch Service domain's internal database. Only specify if internal_user_database_enabled is set to true"
}

variable "master_user_password" {
  type        = string
  default     = null
  description = "(Optional) Main user's password, which is stored in the Amazon Elasticsearch Service domain's internal database. Only specify if internal_user_database_enabled is set to true"
}

variable "desired_state" {
  type        = string
  description = "(Required) The Auto-Tune desired state for the domain. Valid values: ENABLED or DISABLED."
  default     = "DISABLED"
}

variable "cron_expression_for_recurrence" {
  type        = string
  default     = null
  description = "(Required) A cron expression specifying the recurrence pattern for an Auto-Tune maintenance schedule."
}

variable "duration_value" {
  description = "(Required) An integer specifying the value of the duration of an Auto-Tune maintenance window."
  type        = number
  default     = null
}

variable "duration_unit" {
  type        = string
  description = " (Required) The unit of time specifying the duration of an Auto-Tune maintenance window. Valid values: HOURS"
  default     = "HOURS"
}

variable "start_time" {
  type        = string
  default     = null
  description = " (Required) Date and time at which to start the Auto-Tune maintenance schedule in RFC3339 format."
}

variable "instance_count" {
  type        = number
  description = "(Optional) Number of instances in the cluster."
  default     = 1
}

variable "instance_type" {
  type        = string
  description = "(Optional) Instance type of data nodes in the cluster."

}

variable "dedicated_master_count" {
  type        = number
  description = "(Optional) Number of dedicated main nodes in the cluster."
  default     = null
}

variable "dedicated_master_enabled" {
  type        = bool
  description = " (Optional) Whether dedicated main nodes are enabled for the cluster."
  default     = false
}

variable "dedicated_master_type" {
  type        = string
  description = " (Optional) Instance type of the dedicated main nodes in the cluster."
}

variable "engine_version" {
  type        = string
  description = "(Optional) Version of Elasticsearch to deploy. Defaults to 1.3"
  default     = "OpenSearch_1.3"
}

variable "warm_enabled" {
  type        = bool
  description = "(Optional) Whether to enable warm storage."
  default     = false
}

variable "warm_type" {
  type        = string
  default     = null
  description = "(Optional) Instance type for the OpenSearch cluster's warm nodes. Valid values are ultrawarm1.medium.search, ultrawarm1.large.search and ultrawarm1.xlarge.search. warm_type can be only and must be set when warm_enabled is set to true."
}

variable "warm_count" {
  type        = number
  default     = null
  description = "(Optional) Number of warm nodes in the cluster. Valid values are between 2 and 150. warm_count can be only and must be set when warm_enabled is set to true."
}

variable "availability_zone_count" {
  type        = number
  default     = 2
  description = " (Optional) Number of Availability Zones for the domain to use with zone_awareness_enabled. Defaults to 2. Valid values: 2 or 3."
}

variable "ebs_volume_size" {
  type        = number
  description = " (Required if ebs_enabled is set to true.) Size of EBS volumes attached to data nodes (in GiB)."
  default     = 10
}

variable "ebs_volume_type" {
  type        = string
  description = "(Optional) Type of EBS volumes attached to data nodes."

}

variable "log_eabled" {
  type        = bool
  description = "Enable log or not"
  default     = false
}

variable "log_type" {
  type = string
  description = " (Required) Type of OpenSearch log. Valid values: INDEX_SLOW_LOGS, SEARCH_SLOW_LOGS, ES_APPLICATION_LOGS, AUDIT_LOGS."
}

variable "cloudwatch_log_group_arn" {
  type        = string
  default     = ""
  description = "(Required) ARN of the Cloudwatch log group to which log needs to be published."
}

variable "security_ids" {
  type = list(string)
  description = " (Optional) List of VPC Security Group IDs to be applied to the OpenSearch domain endpoints. If omitted, the default Security Group for the VPC will be used"
}

variable "subnet_ids" {
  type = list(string)
  description = "(Required) List of VPC Subnet IDs for the OpenSearch domain endpoints to be created in."
}