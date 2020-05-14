# terraform-module-azuread-group

## Usage
See `examples` folders for usage of this module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| azuread | >= 0.7.0 |

## Providers

| Name | Version |
|------|---------|
| azuread | >= 0.7.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ad\_group\_enabled | Bollean flag whcih describes whether or not to enable the AD group. | `bool` | `false` | no |
| ad\_group\_members | A set of members who should be present in this Group. Supported Object types are Users, Groups or Service Principals. NOTE: Do not use `azuread_group_member` at the same time as the `members` argument. | `list(list(string))` | <pre>[<br>  null<br>]</pre> | no |
| ad\_group\_names | The list of names of AD groups. changing this will force to create a new resource. NOTE: Group names are not unique within Azure Active Directory. The value is `REQUIRED` | `list(string)` | `[]` | no |
| ad\_group\_owners | A set of owners who own this Group. Supported Object types are Users or Service Principals. NOTE: Do not use `azuread_group_owner` at the same time as the `owners` argument. | `list(list(string))` | <pre>[<br>  null<br>]</pre> | no |
| ad\_user\_account\_enabled | Boolean flag list which describes whether the user account is enabled or disabled. Default to `true` | `list(bool)` | <pre>[<br>  true<br>]</pre> | no |
| ad\_user\_display\_names | The list of names to display in the address book for the user. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| ad\_user\_end\_indexes | The end index of the AD user user list. The end index is exclusive. | `list(number)` | `[]` | no |
| ad\_user\_force\_password\_change | Boolean flag list which describes whether the user is forced to change the password during the next sign-in. Defaults to `false`. | `list(string)` | <pre>[<br>  false<br>]</pre> | no |
| ad\_user\_mail\_nicknames | The list of mail alias for the user. Defaults to the user name part of the user principal name. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| ad\_user\_passwords | The passwords for the User. The password must satisfy minimum requirements as specified by the password policy. The maximum length is 256 characters. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| ad\_user\_principal\_names | The list of User Principal Name of the Azure AD User. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| ad\_user\_start\_indexes | The start index of the AD user list.The start index is inclusive. | `list(number)` | <pre>[<br>  0<br>]</pre> | no |
| ad\_user\_usage\_locations | The list of usage location of the User. Required for users that will be assigned licenses due to legal requirement to check for availability of services in countries. The usage location is a two letter country code (ISO standard 3166). Examples include: `NO`, `JP`, and `GB`. Cannot be reset to null once set. | `list(string)` | <pre>[<br>  "CA"<br>]</pre> | no |
| ad\_users\_enabled | Boolean flag whcih describes whether or not to enabled the AD user resource. | `bool` | `false` | no |
| enabled | Whether or not to enable the module. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| ad\_group\_ids | The object IDs of the groups. |
| ad\_group\_members | The members of the group. |
| ad\_group\_names | The display names of the groups. |
| ad\_group\_owners | The owners of the group. |
| ad\_user\_ids | The IDs of the users. |
| ad\_user\_mail | The primary email address of the Azure AD user. |
| ad\_user\_object\_ids | The object IDS of the users. |
| group\_id\_map | The map of group name and their IDs. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
