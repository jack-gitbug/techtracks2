  /* executed by dbt */
  {{ config(materialized='table') }}

with
    source as (
                select
                    id
                    , enrolid
                    , userid
                    , to_timestamp(timestart) as time_start
                    , to_timestamp(timeend) as time_end
                from {{ source('moodle_training','mdl_user_enrolments') }}
        )
select *
from source