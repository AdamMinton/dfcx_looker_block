include: "/views/dfcx_transcript.view.lkml"
include: "/views/dfcx_step_webhook_status.view.lkml"
include: "/views/dfcx_session_heuristic_outcome.view.lkml"
include: "/views/dfcx_agent_name.view.lkml"

explore: dfcx_transcript {
  hidden: yes

  persist_with: hourly

  join: dfcx_transcript__webhooks {
    view_label: "DFCX Transcript: Webhooks"
    sql: LEFT JOIN UNNEST(${dfcx_transcript.webhooks}) as dfcx_transcript__webhooks ;;
    relationship: one_to_many
  }

  join: dfcx_transcript__execution_sequence {
    view_label: "DFCX Transcript: Execution Sequence"
    sql: LEFT JOIN UNNEST(${dfcx_transcript.execution_sequence}) as dfcx_transcript__execution_sequence ;;
    relationship: one_to_many
  }

  join: dfcx_transcript__alternative_matched_intents {
    view_label: "DFCX Transcript: Alternative Matched Intents"
    sql: LEFT JOIN UNNEST(${dfcx_transcript.alternative_matched_intents}) as dfcx_transcript__alternative_matched_intents ;;
    relationship: one_to_many
  }

  join: dfcx_step_webhook_status {
    view_label: "DFCX Transcript: Webhooks"
    type: left_outer
    sql_on: ${dfcx_transcript.session_start_time} = ${dfcx_step_webhook_status.session_start_time}
      AND ${dfcx_transcript.session_id} = ${dfcx_step_webhook_status.session_id}
      AND ${dfcx_transcript.position} = ${dfcx_step_webhook_status.position}
      AND ${dfcx_transcript__webhooks.step} = ${dfcx_step_webhook_status.step};;
    relationship: one_to_many
  }

  join: dfcx_agent_name {
    view_label: "DFCX Transcript: Agent Name"
    sql_on: ${dfcx_transcript.agent_id} = ${dfcx_agent_name.agent_id} ;;
    relationship: many_to_one
  }

  join: dfcx_transcript__actions {
    view_label: "DFCX Transcript: Actions"
    sql: LEFT JOIN UNNEST(${dfcx_transcript.actions}) as dfcx_transcript__actions ;;
    relationship: one_to_many
  }

}
