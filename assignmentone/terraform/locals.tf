locals {
  name = join("-", [var.application_name, var.role, var.dtap])
}
