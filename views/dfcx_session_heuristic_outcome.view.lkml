view: dfcx_session_heuristic_outcome {
  sql_table_name: `@{project_id}.@{dataform_schema}.dfcx_session_heuristic_outcome`;;

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${session_id} ;;
  }

  dimension: agent_response_escalation {
    hidden: yes
    type: yesno
    sql: ${TABLE}.agent_response_escalation ;;
  }

  dimension: came_from_aep {
    hidden: yes
    type: yesno
    sql: ${TABLE}.came_from_aep ;;
  }

  dimension: can_heuristic_outcome_be_determined {
    hidden: yes
    type: yesno
    sql: ${TABLE}.can_heuristic_outcome_be_determined ;;
  }

  dimension: escalated_during_last_turn {
    hidden: yes
    type: yesno
    sql: ${TABLE}.escalated_during_last_turn ;;
  }

  dimension: escalation_indicator_during_last_turn {
    hidden: yes
    type: yesno
    sql: ${TABLE}.escalation_indicator_during_last_turn ;;
  }

  dimension: first_position_req_agent {
    hidden: yes
    type: number
    sql: ${TABLE}.first_position_req_agent ;;
  }

  dimension: handled_by {
    hidden: yes
    type: string
    sql: ${TABLE}.handled_by ;;
  }

  dimension: hangup {
    hidden: yes
    type: yesno
    sql: ${TABLE}.hangup ;;
  }

  dimension: heuristic_outcome {
    hidden: yes
    type: string
    sql: ${TABLE}.heuristic_outcome ;;
  }

  dimension: position {
    hidden: yes
    type: number
    sql: ${TABLE}.position ;;
  }

  dimension: requested_spanish {
    hidden: yes
    type: yesno
    sql: ${TABLE}.requested_spanish ;;
  }

  dimension: routed_away_during_last_turn {
    hidden: yes
    type: yesno
    sql: ${TABLE}.routed_away_during_last_turn ;;
  }

  dimension: rule_applied {
    hidden: yes
    type: string
    sql: ${TABLE}.rule_applied ;;
  }

  dimension: rule_applied_order {
    hidden: yes
    type: number
    sql: ${TABLE}.rule_applied_order ;;
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

  dimension: task_list_null {
    hidden: yes
    type: yesno
    sql: ${TABLE}.task_list_null ;;
  }

  dimension: unable_to_hear {
    hidden: yes
    type: yesno
    sql: ${TABLE}.unable_to_hear ;;
  }

  dimension: user_goodbye {
    hidden: yes
    type: yesno
    sql: ${TABLE}.user_goodbye ;;
  }

}
