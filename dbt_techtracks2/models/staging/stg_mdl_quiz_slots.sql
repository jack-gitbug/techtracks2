 {{ config(materialized='table') }}

with
    source as (
                select
                    id
                    , "page"
                    , slot
                    , quizid
                    , maxmark
                    , questionid
                from {{ source('moodle_training','mdl_quiz_slots') }}
        )
select *
from source