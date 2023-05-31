variable "account" {
  type = string
  description = "Provide the account details inder which the object to be created"

}

variable "username" {
    type = string
    description = "Provide the usename to establish connection"
    default = "adarshsud"
  
}

variable "password" {
    type = string
    description = "Provide the password to establish connection"
}


# variable "DataBase_name" {
#     type = string
#     description = "Provide the DB name to be created" 
# }

# variable "data_retention_time_in_days" {
#     type = number
#     description = "Provide the data retention time"
#     default = 30
  
# }

# variable "schema_name" {
#     type = string
#     description = "Provide the schema name"
  
# }

# variable "transient" {
#    type = bool
#    description = "Transient schemas do not have a Fail-safe period so they do not incur additional storage costs once they leave Time Travel; however, this means they are also not protected by Fail-safe in the event of a data loss"
# }

# variable "managed" {
#   type = bool
#   description = "Managed access schemas centralize privilege management with the schema owner"
# }