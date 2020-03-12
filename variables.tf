###
# General
###

variable "enabled" {
  description = "Whether or not to enable the module."
  default     = true
}

###
# AD users
###

variable "ad_users_enabled" {
  description = "Boolean flag whcih describes whether or not to enabled the AD user resource."
  default     = false
}

variable "ad_user_principal_names" {
  description = "The list of User Principal Name of the Azure AD User. "
  type        = list(string)
  default     = [""]
}

variable "ad_user_display_names" {
  description = "The list of names to display in the address book for the user."
  type        = list(string)
  default     = [""]
}

variable "ad_users_passwords" {
  description = "The passwords for the User. The password must satisfy minimum requirements as specified by the password policy. The maximum length is 256 characters. "
  type        = list(string)
  default     = [""]
}

variable "ad_user_account_enabled" {
  description = "Boolean flag list which describes whether the user account is enabled or disabled. Default to `true`"
  type        = list(bool)
  default     = [true]
}

variable "ad_user_mail_nicknames" {
  description = "The list of mail alias for the user. Defaults to the user name part of the user principal name. "
  type        = list(string)
  default     = [""]
}

variable "ad_user_force_password_change" {
  description = "Boolean flag list which describes whether the user is forced to change the password during the next sign-in. Defaults to `false`."
  type        = list(string)
  default     = [false]
}

variable "ad_user_usage_locations" {
  description = "The list of usage location of the User. Required for users that will be assigned licenses due to legal requirement to check for availability of services in countries. The usage location is a two letter country code (ISO standard 3166). Examples include: `NO`, `JP`, and `GB`. Cannot be reset to null once set.  "
  type        = list(string)
  default     = ["CA"]
}

###
# AD group
###

variable "ad_group_enabled" {
  description = "Bollean flag whcih describes whether or not to enable the AD group."
  default     = false
}

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

variable "ad_user_start_indexes" {
  description = "The start index of the AD user list.The start index is inclusive."
  type        = list(number)
  default     = [0]
}

variable "ad_user_end_indexes" {
  description = "The end index of the AD user user list. The end index is exclusive."
  type        = list(number)
  default     = []
}
