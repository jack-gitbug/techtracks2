  /* executed by dbt */
 {{ config(materialized='table') }}

with
    source as (
                select
                    id
                    , itemid 
                    , userid
                    , finalgrade
                    , to_timestamp(timecreated) as time_created
                    , to_timestamp(timemodified) as time_modified
                from {{ source('moodle_training','mdl_grade_grades') }}
        )
select *
from source