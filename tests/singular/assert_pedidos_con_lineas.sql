{{
    config(
        severity='error',
        warn_if='>0',
        error_if='>10'
    )
}}

select
      a.order_id
from {{ ref('fct_orders') }} a
left join {{ ref('fct_order_item') }} b
on a.order_id  = b.order_id 
where b.order_item_id is null