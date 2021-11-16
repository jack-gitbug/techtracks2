 {{ config(materialized='table') }}

with
    source as (
                select
                    id
                    , courseid
                    , userid
                    , roleid
                    , to_timestamp(timeend) as time_end
                    , statsreads
                    , statswrites
                    , stattype 
                from {{ source('moodle_training','mdl_stats_user_daily') }}
        )
select *
from source