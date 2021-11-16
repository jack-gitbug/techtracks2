 {{ config(materialized='table') }}

with
    source as (
                select
                    id
                    , "name" as track
                    , to_timestamp(timecreated) as time_created
                    , to_timestamp(timemodified) as time_modified
                from {{ source('moodle_training','mdl_cohort') }}
        )
select *
from source