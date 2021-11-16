 {{ config(materialized='table') }}

with
    source as (
                select
                    id
                    , quiz
                    , grade
                    , userid
                    , to_timestamp(timemodified) as time_modified
                from {{ source('moodle_training','mdl_quiz_grades') }}
        )
select *
from source