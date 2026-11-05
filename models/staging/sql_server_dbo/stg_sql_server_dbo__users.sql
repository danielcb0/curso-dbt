-- stg_sql_server_dbo__users

with source as (
    select * from {{ source ('sql_server_dbo', 'users') }}
),
renamed as (
    select 
        USER_ID
        , FIRST_NAME
        , LAST_NAME
        , EMAIL
        , PHONE_NUMBER
        , ADDRESS_ID
        , CREATED_AT
        , UPDATED_AT
        , coalesce(_FIVETRAN_DELETED, FALSE)    as is_deleted
        , _FIVETRAN_SYNCED                      as date_load
        from source
)

select * from renamed


