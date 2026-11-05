-- slv_sql_server_dbo__users

with users as (
    select * from {{ ref('stg_sql_server_dbo__users') }}

),
cleaned as (
    select
         USER_ID
        , FIRST_NAME
        , LAST_NAME
        , EMAIL
        , PHONE_NUMBER
        , ADDRESS_ID
        , CREATED_AT
        , UPDATED_AT
        ,date_load
    from users
    where not is_deleted
)

select * from cleaned







