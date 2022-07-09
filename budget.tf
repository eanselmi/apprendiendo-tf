resource "aws_budgets_budget" "tfer--Apprendiendo" {
  account_id  = "563337348171"
  budget_type = "COST"

  cost_types {
    include_credit             = "false"
    include_discount           = "true"
    include_other_subscription = "true"
    include_recurring          = "true"
    include_refund             = "false"
    include_subscription       = "true"
    include_support            = "true"
    include_tax                = "true"
    include_upfront            = "true"
    use_amortized              = "false"
    use_blended                = "false"
  }

  limit_amount = "15.0"
  limit_unit   = "USD"
  name         = "Apprendiendo"

  notification {
    comparison_operator        = "GREATER_THAN"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = ["nazareno.anselmi@gmail.com"]
    threshold                  = "50"
    threshold_type             = "PERCENTAGE"
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = ["nazareno.anselmi@gmail.com"]
    threshold                  = "75"
    threshold_type             = "PERCENTAGE"
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = ["nazareno.anselmi@gmail.com"]
    threshold                  = "90"
    threshold_type             = "PERCENTAGE"
  }

  time_period_end   = "2087-06-15_00:00"
  time_period_start = "2021-06-01_00:00"
  time_unit         = "MONTHLY"
}