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

output "ad_group_members" {
  description = "The members of the group."
  value       = azuread_group.this.*.members
}

output "ad_group_owners" {
  description = "The owners of the group."
  value       = azuread_group.this.*.owners
}

###
# AD group member
###
output "ad_group_member_ids" {
  description = "The IDs of the AD group members."
  value       = compact(concat(azuread_group_member.this.*.id, [""]))
}
