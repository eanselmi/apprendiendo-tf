# data "terraform_remote_state" "local" {
#   backend = "local"

#   config = {
#     path = "terraform.tfstate"
#   }
# }


# data "terraform_remote_state" "remote" {
#   backend = "remote"
#   config = {
#     organization = "eanselmi"
#     workspaces = {
#       name = "Apprendiendo"
#     }
#   }
# }
