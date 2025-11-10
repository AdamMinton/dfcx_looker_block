view: dfcx_transitions {
  sql_table_name: `@{project_id}.@{dataform_schema}.dfcx_transitions`;;

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    type: string
    sql: CONCAT(${session_id}, ${position_after}) ;;
  }

  dimension: agent_id {
    hidden: yes
    type: string
    sql: ${TABLE}.agent_id ;;
  }

  dimension: agent_response_after {
    type: string
    sql: ${TABLE}.agent_response_after ;;
  }

  dimension: agent_response_before {
    type: string
    sql: ${TABLE}.agent_response_before ;;
  }

  dimension: confidence {
    type: number
    sql: ${TABLE}.confidence ;;
  }

  dimension: flow_after {
    type: string
    sql: ${TABLE}.flow_after ;;
  }

  dimension: flow_before {
    type: string
    sql: ${TABLE}.flow_before ;;
  }

  dimension: has_no_input {
    hidden: yes
    type: yesno
    sql: ${TABLE}.has_no_input ;;
  }

  dimension: has_no_match {
    hidden: yes
    type: yesno
    sql: ${TABLE}.has_no_match ;;
  }

  dimension: has_req_agent {
    hidden: yes
    type: yesno
    sql: ${TABLE}.has_req_agent ;;
  }

  dimension: has_req_agent_plus_escalation {
    hidden: yes
    type: yesno
    sql: ${TABLE}.has_req_agent_plus_escalation ;;
  }

  dimension: has_webhook_failure {
    hidden: yes
    type: yesno
    sql: ${TABLE}.has_webhook_failure ;;
  }

  dimension: interaction_head_intent {
    hidden: yes
    type: string
    sql: ${TABLE}.interaction_head_intent ;;
  }

  dimension: is_escalated {
    hidden: yes
    type: yesno
    sql: ${TABLE}.is_escalated ;;
  }

  dimension: language_code {
    hidden: yes
    type: string
    sql: ${TABLE}.language_code ;;
  }

  dimension: location {
    hidden: yes
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: match_type {
    type: string
    sql: ${TABLE}.match_type ;;
  }

  dimension: matched_intent {
    type: string
    sql: ${TABLE}.matched_intent ;;
  }

  dimension: outcome {
    hidden: yes
    type: string
    sql: ${TABLE}.outcome ;;
  }

  dimension: page_after {
    type: string
    sql: ${TABLE}.page_after ;;
  }

  dimension: page_before {
    type: string
    sql: ${TABLE}.page_before ;;
  }

  dimension: position_after {
    type: number
    sql: ${TABLE}.position_after ;;
  }

  dimension: position_before {
    type: number
    sql: ${TABLE}.position_before ;;
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

  dimension: user_utterance {
    type: string
    sql: ${TABLE}.user_utterance ;;
  }

  measure: total_sessions {
    type: number
    label: "Conversations"
    sql: COUNT(DISTINCT ${session_id}) ;;
  }

  measure: record_count {
    type: count
    label: "Total Turns"
    drill_fields: []
  }

  measure: percent_total {
    type: percent_of_total
    label: "% Total"
    sql: ${total_sessions} ;;
  }

}
