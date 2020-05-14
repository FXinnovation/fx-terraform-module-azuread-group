# Default example

- This will AD groups and associate members to the group.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| azuread | >= 0.7.0 |

## Providers

| Name | Version |
|------|---------|
| azuread | >= 0.7.0 |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| client\_id | n/a | `string` | n/a | yes |
| client\_secret | n/a | `string` | n/a | yes |
| subscription\_id | n/a | `string` | n/a | yes |
| tenant\_id | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| ad\_group\_ids | n/a |
| group\_members | n/a |
| group\_owners | n/a |
| id\_map | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
