-- gold_orders__enriched.sql



with orders_plus as (
    select * from {{ ref('slv_sql_server_dbo__orders') }}
),
addresses_plus as (
    select * from {{ ref('slv_sql_server_dbo__addresses') }}
),
users_plus as (
    select * from {{ ref('slv_sql_server_dbo__users') }}
) 

select 
    a.ORDER_ID
        , a.USER_ID
        , a.ADDRESS_ID_ORDER
        , a.PROMO_ID
        , a.CREATED_AT_ORDER
        , a.ESTIMATED_DELIVERY_AT
        , a.DELIVERED_AT
        , a.TRACKING_ID
        , a.SHIPPING_SERVICE
        , a.SHIPPING_COST
        , a.ORDER_COST
        , a.ORDER_TOTAL
        , a.STATUS
    ,b.address_line
        , b.zipcode
        , b.state
        , b.country
    ,c.FIRST_NAME
        , c.LAST_NAME
        , c.EMAIL
        , c.PHONE_NUMBER
        , c.ADDRESS_ID
        , c.CREATED_AT
        , c.UPDATED_AT 

from orders_plus a
left join addresses_plus b
    on a.ADDRESS_ID_ORDER = b.address_id
left join users_plus c
    on a.user_id = c.user_id
