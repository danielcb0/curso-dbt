-- slv_sql_server_dbo__orders.sql

with orders as (

    select * from {{ ref('stg_sql_server_dbo__orders') }}

),
cleaned as (
    select
            ORDER_ID
        , USER_ID
        , ADDRESS_ID_ORDER
        , PROMO_ID
        , CREATED_AT_ORDER
        , ESTIMATED_DELIVERY_AT
        , DELIVERED_AT
        , TRACKING_ID
        , SHIPPING_SERVICE
        , SHIPPING_COST
        , ORDER_COST
        , ORDER_TOTAL
        , STATUS
        ,date_load

    from orders
    where not is_deleted
)

select * from cleaned






