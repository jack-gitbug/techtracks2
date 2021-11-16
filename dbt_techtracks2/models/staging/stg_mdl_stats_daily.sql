 {{ config(materialized='table') }}

with
    source as (
                select
                    id
                    , courseid
                    , to_timestamp(timeend) as time_end
                    , roleid
                    , stattype
                from {{ source('moodle_training','mdl_stats_daily') }}
        )
select *
from source