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
  source = "../test/module"

  ad_group_enabled = true
  ad_group_names   = ["tftest${random_string.this.result}", "tftest${random_string.this.result}"]
}

data "azuread_group" "example" {
  name = "tftest${random_string.this.result}"
}

data "azuread_group" "example1" {
  name = "tftest${random_string.this.result}"
}

module "example2" {
  source = "../test/module"

  existing_ad_group_member_enabled = true
  existing_ad_group_object_ids     = ["${data.azuread_group.example.object_id}", "${data.azuread_group.example1.object_id}"]
  ad_group_member_object_ids       = ["${azuread_group.example.id}", "${azuread_group.example1.id}"]
}
