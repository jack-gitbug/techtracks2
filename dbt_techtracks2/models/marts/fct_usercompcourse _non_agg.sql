{{ config(materialized='table') }}

with
    usercomp as (
            select
                id
                , userid 
                , courseid
                , case 
                    when proficiency = 1 then 'completed'
                    else 'incompleted'
                end as proficiency
                , competencyid
                , time_created
                , time_modified
            from {{ ref('stg_mdl_competency_usercompcourse') }}
    ),
    users as (
            select
                dim_users.id
            from {{ ref('dim_users') }}
    ),
    course as (
            select
                dim_courses.courseid
            from {{ ref('dim_courses') }}
    ),
    tracks as (
            select
                dim_tracks.userid
            from {{ ref('dim_tracks') }}
    ),
    final as (
            select
                usercomp.id as comp_id
                , usercomp.userid 
                , usercomp.courseid
                , proficiency
                , competencyid
                , time_created
                , time_modified
            from usercomp
            left join users on usercomp.userid = users.id
            left join course on usercomp.courseid = course.courseid
            left join tracks on usercomp.userid = tracks.userid
    )
select *
from final