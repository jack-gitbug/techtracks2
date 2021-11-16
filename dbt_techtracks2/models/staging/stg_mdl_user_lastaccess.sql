 {{ config(materialized='table') }}

with
    source as (
                select
                    id
                    , userid
                    , courseid
                    , to_timestamp(timeaccess) as time_access
                from {{ source('moodle_training','mdl_user_lastaccess') }}
        )
select *
from source