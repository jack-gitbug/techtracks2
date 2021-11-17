 {{ config(materialized='table') }}

with
    source as (
                select
                    id
                    , userid
                    , course
                    , gradefinal
                    , to_timestamp(timecompleted) as time_completed
                from {{ source('moodle_training','mdl_course_completion_crit_compl') }}
        )
select *
from source