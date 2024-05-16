with source as (
    select
        campaign_id,
        campaign_name,
        channel
    from {{ ref('campaign_details') }}
)
select * from source