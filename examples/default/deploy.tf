resource "random_string" "this" {
  length  = 6
  upper   = false
  special = false
}

resource "azuread_user" "example" {
  user_principal_name = "tftest2${random_string.this.result}@test.com"
  display_name        = "J. Doe${random_string.this.result}"
  mail_nickname       = "tftest2${random_string.this.result}"
  password            = "SecretP@sswd99!"
}

resource "azuread_user" "example1" {
  user_principal_name = "tftest1${random_string.this.result}@test.com"
  display_name        = "J. Doe${random_string.this.result}"
  mail_nickname       = "tftest1${random_string.this.result}"
  password            = "SecretP@sswd99!"
}

module "example" {
  source = "../.."

  ad_group_names   = ["tftest${random_string.this.result}", "tftest${random_string.this.result}"]
  ad_group_members = [["${azuread_user.example.object_id}"], ["${azuread_user.example1.object_id}"]]

}
