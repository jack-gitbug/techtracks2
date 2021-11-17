  /* executed by dbt */
  {{ config(materialized='table') }}

with
    source as (
                select
                    id
                    , "name" as quiz_name
                    , grade
                    , course
                    , to_timestamp(timecreated) as time_created
                    , to_timestamp(timemodified) as time_modified
                from {{ source('moodle_training','mdl_quiz') }}
        )
select *
from source