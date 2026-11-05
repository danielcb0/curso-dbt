-- stg_sql_server_dbo__orders.sql



with source as (
    select * from {{ source('sql_server_dbo', 'orders')}}
),

renamed as (

    select
        ORDER_ID
        , USER_ID
        , ADDRESS_ID as ADDRESS_ID_ORDER
        , PROMO_ID
        , CREATED_AT AS CREATED_AT_ORDER
        , ESTIMATED_DELIVERY_AT
        , DELIVERED_AT
        , TRACKING_ID
        , SHIPPING_SERVICE
        , SHIPPING_COST
        , ORDER_COST
        , ORDER_TOTAL
        , STATUS
        , coalesce(_FIVETRAN_DELETED, false)    as is_deleted
        , _FIVETRAN_SYNCED                      as date_load

    from source


)

select * from renamed