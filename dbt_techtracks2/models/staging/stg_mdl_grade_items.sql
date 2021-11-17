  /* executed by dbt */
 {{ config(materialized='table') }}

with
    source as (
                select
                    id
                    , courseid 
                    , grademax
                    , itemname
                    , itemtype
                    , categoryid
                    , gradepass
                    , to_timestamp(timecreated) as time_created
                    , to_timestamp(timemodified) as time_modified
                from {{ source('moodle_training','mdl_grade_items') }}
        )
select *
from source