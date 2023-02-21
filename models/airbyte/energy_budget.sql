{{ config(materialized='table') }}

select buy.date as buy_date, price.*, -buy.demand*price.price as budget
from {{ source('sandbox', 'omie_energy_buy') }} as buy
left join {{ source('sandbox', 'omie_price_hour') }} as price on buy.date = price.date
