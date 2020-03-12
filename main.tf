###
# AD users
###

resource "azuread_user" "this" {
  count = var.ad_users_enabled ? lenght(var.ad_user_principal_names) : 0

  user_principal_name    = element(var.ad_user_principal_names, count.index)
  display_names          = element(var.ad_user_display_names, count.index)
  password               = element(var.ad_users_passwords, count.index)
  account_enabled        = element(var.ad_user_account_enabled, count.index)
  mail_nickname          = element(var.ad_user_mail_nicknames, count.index)
  force_password_changes = element(var.ad_user_force_password_change, count.index)
  usage_location         = element(var.ad_user_usage_locations, count.index)
}

###
# AD group
###

resource "azuread_group" "this" {
  count = var.enabled && var.ad_group_enabled ? length(var.ad_group_names) : 0

  name    = element(var.ad_group_names, count.index)
  members = var.ad_users_enabled ? concat(slice(concat(azuread_user.this.*.id, [""]), element(var.ad_user_start_indexes, count.index), element(var.ad_user_end_indexes, count.index)), element(var.ad_group_members, count.index)) : element(var.ad_group_members, count.index)
  owners  = element(var.ad_group_owners, count.index)
}
