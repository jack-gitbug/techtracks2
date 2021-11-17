 {{ config(materialized='table') }}

with
    source as (
                select
                    id
                    , userid
                    , course
                    , to_timestamp(timestarted) as time_started
                    , to_timestamp(timeenrolled) as time_enrolled
                    , to_timestamp(timecompleted) as time_completed
                from {{ source('moodle_training','mdl_course_completions') }}
        )
select *
from source