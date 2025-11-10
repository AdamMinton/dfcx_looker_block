view: dfcx_session_common_lookups {
  sql_table_name: `@{project_id}.@{dataform_schema}.dfcx_session_common_lookups`;;

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${session_id} ;;
  }

  dimension: agent_id {
    hidden: yes
    type: string
    sql: ${TABLE}.agent_id ;;
  }

  dimension: cobweb_url {
    type: string
    sql: ${TABLE}.cobweb_url ;;
  }

  dimension: dfcx_url {
    type: string
    sql: ${TABLE}.dfcx_url ;;
  }

  dimension: final_interaction_head_intent {
    hidden: yes
    type: string
    sql: ${TABLE}.final_interaction_head_intent ;;
  }

  dimension: location {
    hidden: yes
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: logs_explorer_url {
    type: string
    sql: ${TABLE}.logs_explorer_url ;;
  }

  dimension: project_id {
    hidden: yes
    type: string
    sql: ${TABLE}.project_id ;;
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

  dimension: transcript_explorer_url {
    type: string
    sql: ${TABLE}.transcript_explorer_url ;;
  }

}
