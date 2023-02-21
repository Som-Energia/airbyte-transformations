
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

select *, -buy.demand*price.price as budget
from {{ ref('sandbox', 'omie_energy_buy')}} as buy
left join {{ ref('sandbox', 'omie_price_hour')}} as price on buy.date = price.date

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
