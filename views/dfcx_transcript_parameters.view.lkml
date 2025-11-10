view: dfcx_transcript_parameters {
  sql_table_name: `@{project_id}.@{dataform_schema}.dfcx_transcript_parameters`;;

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    type: string
    sql: CONCAT(${session_id}, ${position}) ;;
  }

  dimension: aam_intent_from_gdf {
    type: string
    sql: ${TABLE}.aam_intent_from_gdf ;;
  }

  dimension: adjustment_list {
    type: string
    sql: ${TABLE}.adjustment_list ;;
  }

  dimension: ani {
    type: string
    sql: ${TABLE}.ani ;;
  }

  dimension: bc_version {
    type: string
    sql: ${TABLE}.bc_version ;;
  }

  dimension: bills_on_id {
    hidden: yes
    sql: ${TABLE}.bills_on_id ;;
  }

  dimension: dnis_category {
    type: string
    sql: ${TABLE}.dnis_category ;;
  }

  dimension: head_intent {
    type: string
    sql: ${TABLE}.head_intent ;;
  }

  dimension: pending_adjustment {
    type: string
    sql: ${TABLE}.pending_adjustment ;;
  }

  dimension: pending_adjustment_description {
    hidden: yes
    sql: ${TABLE}.pending_adjustment_description ;;
  }

  dimension: pending_adjustment_description_for_voice {
    hidden: yes
    sql: ${TABLE}.pending_adjustment_description_for_voice ;;
  }

  dimension: position {
    type: number
    sql: ${TABLE}.position ;;
  }

  dimension: products_on_id {
    hidden: yes
    sql: ${TABLE}.products_on_id ;;
  }

  dimension: provided_id {
    type: string
    sql: ${TABLE}.provided_id ;;
  }

  dimension: provided_id_matched_to_bill {
    type: string
    sql: ${TABLE}.provided_id_matched_to_bill ;;
  }

  dimension: provided_intent {
    type: string
    sql: ${TABLE}.provided_intent ;;
  }

  dimension: provided_product_line {
    hidden: yes
    sql: ${TABLE}.provided_product_line ;;
  }

  dimension_group: request {
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

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension_group: session_start {
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

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: verint_id {
    type: string
    sql: ${TABLE}.verint_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

view: dfcx_transcript_parameters__bills_on_id {
  dimension: dfcx_transcript_parameters__bills_on_id {
    type: string
    sql: dfcx_transcript_parameters__bills_on_id ;;
  }
}

view: dfcx_transcript_parameters__products_on_id {
  dimension: dfcx_transcript_parameters__products_on_id {
    type: string
    sql: dfcx_transcript_parameters__products_on_id ;;
  }
}

view: dfcx_transcript_parameters__provided_product_line {
  dimension: dfcx_transcript_parameters__provided_product_line {
    type: string
    sql: dfcx_transcript_parameters__provided_product_line ;;
  }
}

view: dfcx_transcript_parameters__pending_adjustment_description {
  dimension: dfcx_transcript_parameters__pending_adjustment_description {
    type: string
    sql: dfcx_transcript_parameters__pending_adjustment_description ;;
  }
}

view: dfcx_transcript_parameters__pending_adjustment_description_for_voice {
  dimension: dfcx_transcript_parameters__pending_adjustment_description_for_voice {
    type: string
    sql: dfcx_transcript_parameters__pending_adjustment_description_for_voice ;;
  }
}
