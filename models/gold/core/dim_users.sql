-- =============================================================================
-- dim_users
-- =============================================================================

with addresses as (
    select * from {{ ref('slv_sql_server_dbo__addresses') }}
),

users as (
    select * from {{ ref('slv_sql_server_dbo__addresses') }}
),

final as (
    select
          a.address_id
        , a.address_line
        , a.zipcode
        , a.state
        , a.country
        , c.country_code
        , c.continent
        , a.date_load
    from users b
    left join addresses a 
        on b.
)

select * from final
