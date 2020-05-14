###
# AD group
###

output "ad_group_ids" {
  description = "The object IDs of the groups. "
  value       = compact(concat(azuread_group.this.*.id, [""]))
}

output "ad_group_names" {
  description = "The display names of the groups."
  value       = compact(concat(azuread_group.this.*.name, [""]))
}

output "group_id_map" {
  description = "The map of group name and their IDs."
  value       = zipmap(var.ad_group_names, compact(concat(azuread_group.this.*.id, [""])))
}

output "ad_group_members" {
  description = "The members of the group."
  value       = azuread_group.this.*.members
}

output "ad_group_owners" {
  description = "The owners of the group."
  value       = azuread_group.this.*.owners
}

###
# AD users
###

output "ad_user_object_ids" {
  description = "The object IDS of the users."
  value       = compact(concat(azuread_user.this.*.object_id, [""]))
}

output "ad_user_ids" {
  description = "The IDs of the users."
  value       = compact(concat(azuread_user.this.*.id, [""]))
}

output "ad_user_mail" {
  description = "The primary email address of the Azure AD user."
  value       = compact(concat(azuread_user.this.*.mail, [""]))
}
