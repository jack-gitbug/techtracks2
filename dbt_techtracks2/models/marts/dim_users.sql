{{ config(materialized='table') }}

with
    users as (
                select
                    id
                    , username
                    , fullname
                    , email
                    , first_access
                    , last_access
                    , last_login
                from {{ ref('stg_mdl_user') }}
    )
select *
from users