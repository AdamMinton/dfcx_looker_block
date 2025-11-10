view: dfcx_agent_name {
  sql_table_name: `whisper-test-378918.dataform_ccai_main.dfcx_agent_name`
    ;;

  dimension: agent_id {
    type: string
    sql: ${TABLE}.agent_id ;;
  }

  dimension: agent_name {
    type: string
    sql: ${TABLE}.agent_name ;;
  }

  measure: count {
    type: count
    drill_fields: [agent_name]
  }
}
