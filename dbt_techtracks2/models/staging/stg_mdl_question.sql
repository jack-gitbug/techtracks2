  /* executed by dbt */
  {{ config(materialized='table') }}

with
    source as (
                select
                    id
                    , "name" as question_name
                    , qtype as question_type
                    , questiontext
                    , category
                    , to_timestamp(timecreated) as time_created
                    , to_timestamp(timemodified) as time_modified
                from {{ source('moodle_training','mdl_question') }}
        )
select *
from source