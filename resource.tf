locals {
#  config = csvdecode(file("../configs/config.csv")) # not being used now
  jsonconfig = jsondecode(file("../configs/Definition.json"))
}

resource "snowflake_database" "SnowDB" {
    # count = length(local.config)   
    # name = local.config[count.index].DBname
    # comment = "New Data base created"
    # data_retention_time_in_days = local.config[count.index].retention_time
# with json object
   count = length(local.jsonconfig.databases)
   name = local.jsonconfig.databases[count.index].name
   comment = "New DB created using terraform"
   data_retention_time_in_days = local.jsonconfig.databases[count.index].retention_time   
}

resource "snowflake_schema" "DBschema" {
    # count = length(local.config)
    # database = local.config[count.index].DBname
    # name = local.config[count.index].schema_name
    # comment = ""
    
    # is_managed = local.config[count.index].is_managed
    # is_transient = local.config[count.index].is_transient

# with json object
    count = length(local.jsonconfig.databases)
    database = local.jsonconfig.databases[count.index].name
    name = local.jsonconfig.databases[count.index].schema_name
    comment = ""
    
    is_managed = local.jsonconfig.databases[count.index].is_managed
    is_transient = local.jsonconfig.databases[count.index].is_transient

}


resource "snowflake_table" "table" {
    count = length(local.jsonconfig.databases)
    name     = local.jsonconfig.databases[count.index].table_name
    database = local.jsonconfig.databases[count.index].name
    schema   = local.jsonconfig.databases[count.index].schema_name

    dynamic "column" {
    for_each = local.jsonconfig.databases[count.index].columns
    content {
      name     = column.value.name
      type     = column.value.type
      comment  = column.value.comment
      nullable = column.value.nullable
    }
  }
  
}