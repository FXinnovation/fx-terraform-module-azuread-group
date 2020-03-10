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

  ad_group_names = ["tftest${random_string.this.result}", "tftest${random_string.this.result}"]

}

module "example2" {
  source = "../.."

  existing_ad_group_member_enabled = true
  existing_ad_group_object_ids     = module.example.ad_group_ids
  ad_group_member_object_ids       = ["${azuread_group.example.id}", "${azuread_group.example1.id}"]
}
