  /* executed by dbt */
  {{ config(materialized='table') }}

with
    source as (
                select
                    id
                    , "state" as question_status
                    , userid
                    , to_timestamp(timecreated) as time_created
                    , questionattemptid
                from {{ source('moodle_training','mdl_question_attempt_steps') }}
        )
select *
from source