 {{ config(materialized='table') }}

with
    source as (
                select
                    id
                    , username
                    , concat(firstname, ' ', lastname) as fullname
                    , email
                    , to_timestamp(firstaccess) as first_access
                    , to_timestamp(lastaccess) as last_access
                    , to_timestamp(lastlogin) as last_login
                from {{ source('moodle_training','mdl_user') }}
        )
select *
from source