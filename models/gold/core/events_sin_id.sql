{% set columnas_nop = ["event_id","page_url"] %}
select
{{ dbt_utils.star(from=ref('slv_sql_server_dbo__events'), except=columnas_nop) }}
from {{ ref('slv_sql_server_dbo__events') }}
