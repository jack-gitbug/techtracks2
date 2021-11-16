 /* executed by dbt */
 {{ config(materialized='table') }}

with
    source as (
                select
                    id
                    , "name" as course_name 
                    , "type" as tipo 
                    , courseid
                    , "language" as course_language
                    , to_timestamp(timemodified) as time_modified
                    , to_timestamp(timecreated) as time_created
                from {{ source('moodle_training','mdl_badge') }}
        )
select *
from source