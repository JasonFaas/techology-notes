# Terraform Command going through book

## Common commands - TODO: Explain what each are doing
* `terraform --version`
* `terraform init`
* `terraform plan`
* `terraform plan --destroy`
* `terraform graph`
* `terraform apply`
* `terraform apply --auto-approve`
  * Auto approve apply
* `terraform output`
* `terraform destroy`
* `terraform providers`

## How to import yaml file
```
resource "resource_that_uses_file" “stuff” {
  name = “name_of_stuff”

  values = [
    file("${path.module}/filename.yaml")
  ]
```
