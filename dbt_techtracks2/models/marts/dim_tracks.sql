{{ config(materialized='table') }}

with
    nome_track as (
                select
                    id
                    , track
                    , userid
                    , cohortid
                from {{ ref('stg_mdl_cohort_and_members') }}
    ),
    users as (
        select 
            id
            , fullname
        from {{ ref('stg_mdl_user') }}
    ),
    final as (
        select 
            users.fullname
            , nome_track.id
            , track
            , userid
            , cohortid
        from nome_track
        left join users on nome_track.userid = users.id
    )
select *
from final