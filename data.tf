data "aws_organizations_organization" "org" {}

data "aws_caller_identity" "current" {}

#accounts data (tags)
data "aws_organizations_resource_tags" "child_accounts" {
  for_each = {for o in data.aws_organizations_organization.org.non_master_accounts: o.id => o}

  resource_id = each.value.id
}
