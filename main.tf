###
# AD group
###

resource "azuread_group" "this" {
  count = var.enabled ? length(var.ad_group_names) : 0

  name    = element(var.ad_group_names, count.index)
  members = element(var.ad_group_members, count.index)
  owners  = element(var.ad_group_owners, count.index)
}

###
# AD group member
###

resource "azuread_group_member" "this" {
  count = var.enabled && var.ad_group_member_enabled ? var.ad_group_members_count : 0

  group_object_id  = element(var.ad_group_names, count.index) != "" ? element(compact(concat(azuread_group.this.*.id, var.ad_existing_group_member_object_ids)), count.index) : element(var.ad_existing_group_member_object_ids, count.index)
  member_object_id = element(var.ad_group_member_object_ids, count.index)
}
