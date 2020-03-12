resource "random_string" "this" {
  length  = 6
  upper   = false
  special = false
}

resource "azuread_group" "example" {
  name = "tftesta${random_string.this.result}@test.com"
}

resource "azuread_group" "example1" {
  name = "tftestb${random_string.this.result}@test.com"
}

module "example" {
  source = "../.."

  ad_users_enabled        = true
  ad_user_principal_names = ["tftst${random_string.this.result}", "tftst1${random_string.this.result}"]
  ad_user_display_names   = ["tftestgroup1", "tftestgroup2"]
  ad_user_passwords       = ["bobBAZCA%$!#123${random_string.this.result}"]
  ad_group_enabled        = true
  ad_group_names          = ["tftest${random_string.this.result}", "tftest${random_string.this.result}"]
  ad_group_members        = [["${azuread_group.example.id}"], ["${azuread_group.example1.id}"]]

}
