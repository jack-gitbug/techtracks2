  /* executed by dbt */
  {{ config(materialized='table') }}

with
    source as (
                select
                    id
                    , "name" as question
                    , "value" as feedback
                from {{ source('moodle_training','mdl_question_attempt_step_data') }}
        )
select *
from source