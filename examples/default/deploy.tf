resource "random_string" "this" {
  length  = 6
  upper   = false
  special = false
}

resource "azuread_group" "example" {
  name = "tftest1${random_string.this.result}@test.com"
}

resource "azuread_group" "example1" {
  name = "tftest2${random_string.this.result}@test.com"
}

module "example" {
  source = "../.."

  ad_group_enabled = true
  ad_group_names   = ["tftest${random_string.this.result}", "tftesta${random_string.this.result}"]
  ad_group_members = [["${azuread_group.example.id}"], ["${azuread_group.example1.id}"]]
}
