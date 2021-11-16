 {{ config(materialized='table') }}

with
    source as (
                select
                    id
                    , grade
                    , userid 
                    , reviewerid
                    , coalesce ((proficiency), 0) as proficiency
                    , competencyid
                    , to_timestamp(timecreated) as time_created
                    , to_timestamp(timemodified) as time_modified
                from {{ source('moodle_training','mdl_competency_usercomp') }}
        )
select *
from source