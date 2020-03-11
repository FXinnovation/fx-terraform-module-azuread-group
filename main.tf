###
# AD group
###

resource "azuread_group" "this" {
  count = var.enabled && var.ad_group_enabled ? length(var.ad_group_names) : 0

  name    = element(var.ad_group_names, count.index)
  members = element(var.ad_group_members, count.index)
  owners  = element(var.ad_group_owners, count.index)
}

###
# AD group member
###

resource "azuread_group_member" "this" {
  count = var.enabled && var.existing_ad_group_member_enabled ? length(var.existing_ad_group_object_ids) : 0

  group_object_id  = element(var.existing_ad_group_object_ids, count.index)
  member_object_id = element(var.ad_group_member_object_ids, count.index)
}
