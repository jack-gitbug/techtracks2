 {{ config(materialized='table') }}

with
    source as (
                select
                    id
                    , courseid
                    , enrol
                    , to_timestamp(timecreated) as time_created
                from {{ source('moodle_training','mdl_enrol') }}
        )
select *
from source