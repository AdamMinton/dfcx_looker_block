include: "/views/dfcx_session_metadata.view.lkml"
include: "/views/dfcx_transcript.view.lkml"
include: "/views/dfcx_transcript_metadata.view.lkml"
include: "/views/dfcx_interaction.view.lkml"
include: "/views/dfcx_session_heuristic_outcome.view.lkml"
include: "/views/dfcx_session_common_lookups.view.lkml"
include: "/views/dfcx_transitions.view.lkml"
include: "dfcx_transcript.explore.lkml"
include: "dfcx_interaction.explore.lkml"

explore: dfcx_session_metadata {
  label: "DFCX Session"
  view_label: "01 - DFCX Session"
  hidden: no

  persist_with: hourly

  extends: [dfcx_transcript,dfcx_interaction]
  always_filter: {
    filters: [
      dfcx_session_metadata.session_start_date: "30 days"
    ]
  }

  # Workaround for explore filters - will query unique values for the last 7 days
  sql_always_where:
  {% if dfcx_session_metadata.session_start_date._in_query %}
    1 = 1
  {% else %}
    1 = 1
    AND {% if dfcx_session_metadata._in_query %} {{dfcx_session_metadata.session_start_raw._sql}} >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 7 DAY) {% else %} 1=1 {% endif %}
    AND {% if dfcx_transcript._in_query %} {{dfcx_transcript.session_start_raw._sql}} >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 7 DAY) {% else %} 1=1 {% endif %}
    AND {% if dfcx_interaction._in_query %} {{{dfcx_interaction.session_start_raw._sql}} >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 7 DAY) {% else %} 1=1 {% endif %}
  {% endif %}
  ;;

  fields: [ALL_FIELDS*
    ,-dfcx_interaction.session_start_time,-dfcx_interaction.session_start_date,-dfcx_interaction.session_start_week,-dfcx_interaction.session_start_month,-dfcx_interaction.session_start_quarter,-dfcx_interaction.session_start_year
    ,-dfcx_interaction.session_id
  ]

  join: dfcx_session_heuristic_outcome {
    view_label: "01 - DFCX Session"
    type: left_outer
    sql_on:  ${dfcx_session_metadata.session_id} = ${dfcx_session_heuristic_outcome.session_id}
      AND ${dfcx_session_metadata.session_start_time} = ${dfcx_session_heuristic_outcome.session_start_time} ;;
    relationship: one_to_one
  }

  join: dfcx_session_common_lookups {
    view_label: "01 - DFCX Session"
    type: left_outer
    sql_on:  ${dfcx_session_metadata.session_id} = ${dfcx_session_common_lookups.session_id}
      AND ${dfcx_session_metadata.session_start_time} = ${dfcx_session_common_lookups.session_start_time} ;;
    relationship: one_to_one
  }

  join: dfcx_interaction {
    view_label: "02 - DFCX Interaction"
    type: left_outer
    sql_on: ${dfcx_transcript.session_id} = ${dfcx_interaction.session_id}
      AND ${dfcx_transcript.position} BETWEEN ${dfcx_interaction.start_interaction_position} AND ${dfcx_interaction.end_interaction_position}
      AND ${dfcx_transcript.session_start_raw} = ${dfcx_interaction.session_start_raw};;
    relationship: one_to_many
  }

  join: dfcx_interaction__actions {
    view_label: "03 - DFCX Interaction - Actions"
  }

  join: dfcx_transcript {
    view_label: "04 - DFCX Transcript"
    type: left_outer
    sql_on: ${dfcx_session_metadata.session_start_raw} = ${dfcx_transcript.session_start_raw}
      AND ${dfcx_session_metadata.session_id} = ${dfcx_transcript.session_id};;
    relationship: one_to_many
  }

  join: dfcx_transcript_metadata {
    view_label: "04 - DFCX Transcript"
    type: left_outer
    sql_on: ${dfcx_transcript.session_start_raw} = ${dfcx_transcript_metadata.session_start_raw}
      AND ${dfcx_transcript.session_id} = ${dfcx_transcript_metadata.session_id}
      AND ${dfcx_transcript.response_id} = ${dfcx_transcript_metadata.response_id};;
    relationship: one_to_many
  }

  join: dfcx_transcript__alternative_matched_intents {
    view_label: "05 - DFCX Transcript - Alternative Matched Intents"
  }

  join: dfcx_transcript__execution_sequence {
    view_label: "06 - DFCX Execution Sequence"
  }

  join: dfcx_transcript__webhooks {
    view_label: "07 - DFCX Webhooks"
  }

  join: dfcx_step_webhook_status {
    view_label: "07 - DFCX Webhooks"
  }

  join: dfcx_transitions {
    view_label: "08 - DFCX Transitions"
    type: left_outer
    sql_on:  ${dfcx_transcript.session_start_raw} = ${dfcx_transitions.session_start_raw}
    AND ${dfcx_transcript.session_id} = ${dfcx_transitions.session_id}
    AND ${dfcx_transcript.position} = ${dfcx_transitions.position_after};;
    relationship: one_to_one
  }

  join: dfcx_agent_name {
    view_label: "01 - DFCX Session"
  }

}


# join: dfcx_transcript__webhooks {
#   view_label: "Dfcx Transcript: Webhooks"
#   sql: LEFT JOIN UNNEST(${dfcx_transcript.webhooks}) as dfcx_transcript__webhooks ;;
#   relationship: one_to_many
# }

# join: dfcx_transcript__execution_sequence {
#   view_label: "Dfcx Transcript: Execution Sequence"
#   sql: LEFT JOIN UNNEST(${dfcx_transcript.execution_sequence}) as dfcx_transcript__execution_sequence ;;
#   relationship: one_to_many
# }

# join: dfcx_transcript__alternative_matched_intents {
#   view_label: "Dfcx Transcript: Alternative Matched Intents"
#   sql: LEFT JOIN UNNEST(${dfcx_transcript.alternative_matched_intents}) as dfcx_transcript__alternative_matched_intents ;;
#   relationship: one_to_many
# }

# join: dfcx_transcript__execution_sequence__responses {
#   view_label: "Dfcx Transcript: Execution Sequence Responses"
#   sql: LEFT JOIN UNNEST(${dfcx_transcript__execution_sequence.responses}) as dfcx_transcript__execution_sequence__responses ;;
#   relationship: one_to_many
# }

# join: dfcx_step_webhook_status {
#   type: left_outer
#   sql_on: ${dfcx_transcript.session_id} = ${dfcx_step_webhook_status.session_id}
#     AND ${dfcx_transcript.session_start_time} = ${dfcx_step_webhook_status.session_start_time};;
#   relationship: one_to_many
# }
