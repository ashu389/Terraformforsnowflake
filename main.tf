terraform {
#  required_version = ">= 1.1"  
  required_providers {
    snowflake = {
#       source = "chanzuckerberg/snowflake"
        source = "Snowflake-Labs/snowflake"
#        version = "0.31.0"
        version = "~> 0.61"
    }
  }
}

provider "snowflake" {

    account = var.account
    username = var.username
    password = var.password
  
}