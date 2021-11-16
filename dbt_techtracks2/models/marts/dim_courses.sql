{{ config(materialized='table') }}

with
    source1 as (
                select
                courseid
                , category
                , course_name
                from {{ ref('stg_mdl_course') }}
        )
select *
from source1