view: dfcx_step_webhook_status {
  sql_table_name: `@{project_id}.@{dataform_schema}.dfcx_step_webhook_status`;;

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    type: string
    sql: CONCAT(${session_id}, ${position}, ${step}) ;;
  }

  dimension: api_status {
    hidden: yes
    type: string
    sql: ${TABLE}.APIStatus ;;
  }

  dimension: position {
    hidden: yes
    type: number
    sql: ${TABLE}.position ;;
  }

  dimension_group: request {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.request_time ;;
  }

  dimension: did_row_pass {
    hidden: yes
    type: yesno
    sql: ${TABLE}.did_row_pass ;;
  }

  dimension: result {
    hidden: yes
    type: string
    sql: ${TABLE}.result ;;
  }

  dimension: result_did_pass {
    hidden: yes
    type: yesno
    sql: ${TABLE}.result_did_pass ;;
  }

  dimension: session_id {
    hidden: yes
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension_group: session_start {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.session_start_time ;;
  }

  dimension: step {
    hidden: yes
    type: number
    sql: ${TABLE}.step ;;
  }

}
