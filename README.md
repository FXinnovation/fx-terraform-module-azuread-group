# terraform-module-azuread-group

## Usage
See `examples` folders for usage of this module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| azuread | >= 0.7.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| ad\_group\_member\_object\_ids | The object IDs of the Azure AD object you want to add as a member to the group. Supported Object types are `Users`, `Groups` or `Service Principals`. Changing this forces a new resource to be created. NOTE: The Member object has to be present in your Azure Active Directory, either as a Member or a Guest. If enabled the vaule is `REQUIRED`. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| ad\_group\_members | A set of members who should be present in this Group. Supported Object types are Users, Groups or Service Principals. NOTE: Do not use `azuread_group_member` at the same time as the `members` argument. | `list(list(string))` | <pre>[<br>  null<br>]</pre> | no |
| ad\_group\_names | The list of names of AD groups. changing this will force to create a new resource. NOTE: Group names are not unique within Azure Active Directory. The value is `REQUIRED` | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| ad\_group\_owners | A set of owners who own this Group. Supported Object types are Users or Service Principals. NOTE: Do not use `azuread_group_owner` at the same time as the `owners` argument. | `list(list(string))` | <pre>[<br>  null<br>]</pre> | no |
| enabled | Whether or not to enable the module. | `bool` | `true` | no |
| existing\_ad\_group\_member\_enabled | Boolan flag which describes whether or not to ad group member resource. | `bool` | `false` | no |
| existing\_ad\_group\_object\_ids | The list of object IDs of the Azure AD Group you want to add the member to. Changing this forces a new resource to be created. If enabled value is `REQUIRED`. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| ad\_group\_ids | The object IDs of the groups. |
| ad\_group\_member\_ids | The IDs of the AD group members. |
| ad\_group\_members | The members of the group. |
| ad\_group\_names | The display names of the groups. |
| ad\_group\_owners | The owners of the group. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
