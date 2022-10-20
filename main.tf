resource "aws_budgets_budget" "default" {
  for_each = {for o in data.aws_organizations_organization.org.accounts: o.id => o}

  name              = format("%s - %s (%s)", "Monthly Budget", each.value.name, each.value.id)
  budget_type       = "COST"
  limit_amount      = var.per_account_limit
  limit_unit        = "USD"
  time_period_start = "2022-10-01_00:00"
  time_period_end   = "2087-06-14_00:00"
  time_unit         = "MONTHLY"

  cost_filter {
    name = "LinkedAccount"
    values = [each.value.id]
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = [var.notification_email]
  }
}
