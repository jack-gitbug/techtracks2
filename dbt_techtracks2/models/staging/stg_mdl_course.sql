 {{ config(materialized='table') }}

with
    source as (
                select
                    id as courseid
                    , category
                    , fullname as course_name
                from {{ source('moodle_training','mdl_course') }}
        )
select *
from source