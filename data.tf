# data "terraform_remote_state" "local" {
#   backend = "local"

#   config = {
#     path = "terraform.tfstate"
#   }
# }


data "terraform_remote_state" "local" {
  backend = "remote"

  config = {
    organization = "eanselmi"
    workspaces = {
      name = "Apprendiendo"
    }
  }
}