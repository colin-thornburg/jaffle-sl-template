with expenses as (
    select
        campaign_id,
        marketing_expense
    from {{ ref('stg_marketing_expenses') }}
),

customers as (
    select
        campaign_id,
        new_customers_acquired
    from {{ ref('stg_new_customers_acquired') }}
),

campaigns as (
    select
        campaign_id,
        campaign_name,
        channel
    from {{ ref('stg_campaign_details') }}
)

select
    c.campaign_id,
    c.campaign_name,
    c.channel,
    e.marketing_expense,
    n.new_customers_acquired,
    case when n.new_customers_acquired > 0 then e.marketing_expense / n.new_customers_acquired else null end as cac
from campaigns c
join expenses e on c.campaign_id = e.campaign_id
join customers n on c.campaign_id = n.campaign_id