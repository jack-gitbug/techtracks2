 {{ config(materialized='table') }}

with
    nome_track as (
                select
                    id
                    , track
                from {{ ref('stg_mdl_cohort') }}
    ),
    users as (
                select
                    id
                    , userid
                    , cohortid
                from {{ ref('stg_mdl_cohort_members') }}
    ),
    final as (
                select
                    users.id
                    , nome_track.track
                    , users.userid
                    , users.cohortid
                from users
                left join nome_track on users.cohortid = nome_track.id
    )
select *
from final