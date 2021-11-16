 {{ config(materialized='table') }}

with
    source as (
                select
                    id
                    , cast(idnumber as float) as courseid
                    , shortname
                    , sortorder
                    , to_timestamp(timemodified) as time_modified
                from {{ source('moodle_training','mdl_competency') }}
        )
select *
from source