 {{ config(materialized='table') }}

with
    source as (
                select
                    id
                    , "name" as category_name
                from {{ source('moodle_training','mdl_course_categories') }}
        )
select *
from source