 {{ config(materialized='table') }}

with
    source as (
                select
                    id
                    , slot
                    , maxmark
                    , variant
                    , behaviour
                    , questionid
                    , questionsummary
                    , questionusageid
                    , responsesummary
                    , to_timestamp(timemodified) as time_modified
                from {{ source('moodle_training','mdl_question_attempts') }}
        )
select *
from source