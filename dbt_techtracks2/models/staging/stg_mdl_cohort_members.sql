 {{ config(materialized='table') }}

with
    source as (
                select
                    id
                    , userid
                    , cohortid
                    , to_timestamp(timeadded) as time_added
                from {{ source('moodle_training','mdl_cohort_members') }}
        )
select *
from source