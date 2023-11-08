connection: "thelook"

# include all the views
include: "/views/**/*.view"
include: "/lookml_dash.dashboard.lookml"
datagroup: balcazartest_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: balcazartest_default_datagroup

explore: flights {}

explore: orders {
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: order_items {
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

map_layer: poly {
  file: "/poly.json"
}
map_layer: USzip {
  file: "/USZip.json"
}

map_layer: USAzip {
  file: "/USAzip.json"
}
map_layer: USAzipurl {
  url: "https://gist.githubusercontent.com/jefffriesen/6892860/raw/e1f82336dde8de0539a7bac7b8bc60a23d0ad788/zips_us_topo.json"
}


explore: users {}
