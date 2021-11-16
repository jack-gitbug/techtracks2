 {{ config(materialized='table') }}

with
    source as (
                select
                    id
                    , quiz
                    , "state" as quiz_status
                    , userid
                    , attempt
                    , uniqueid
                    , to_timestamp(timestart) as time_start
                    , to_timestamp(timefinish) as time_finish
                    , to_timestamp(timemodified) as time_modified
                from {{ source('moodle_training','mdl_quiz_attempts') }}
        )
select *
from source