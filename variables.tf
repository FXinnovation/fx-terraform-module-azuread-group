###
# General
###

variable "enabled" {
  description = "Whether or not to enable the module."
  default     = true
}

###
# AD group
###

variable "ad_group_names" {
  description = "The list of names of AD groups. changing this will force to create a new resource. NOTE: Group names are not unique within Azure Active Directory. The value is `REQUIRED`"
  type        = list(string)
  default     = [""]
}

variable "ad_group_members" {
  description = "A set of members who should be present in this Group. Supported Object types are Users, Groups or Service Principals. NOTE: Do not use `azuread_group_member` at the same time as the `members` argument. "
  type        = list(list(string))
  default     = [null]
}

variable "ad_group_owners" {
  description = "A set of owners who own this Group. Supported Object types are Users or Service Principals. NOTE: Do not use `azuread_group_owner` at the same time as the `owners` argument."
  type        = list(list(string))
  default     = [null]
}

###
# AD group member
###

variable "ad_group_member_enabled" {
  description = "Boolan flag which describes whether or not to ad group member resource."
  default     = true
}

variable "ad_group_members_count" {
  description = "The number of group members we would like add using this module."
  type        = number
  default     = 1
}


variable "ad_existing_group_member_object_ids" {
  description = "The list of object IDs of the Azure AD Group you want to add the member to. Changing this forces a new resource to be created. If enabled value is `REQUIRED`."
  type        = list(string)
  default     = [""]
}

variable "ad_group_member_object_ids" {
  description = "The object IDs of the Azure AD object you want to add as a member to the group. Supported Object types are `Users`, `Groups` or `Service Principals`. Changing this forces a new resource to be created. NOTE: The Member object has to be present in your Azure Active Directory, either as a Member or a Guest. If enabled the vaule is `REQUIRED`."
  type        = list(string)
  default     = [""]
}
