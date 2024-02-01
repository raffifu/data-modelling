with 
distinct_tr as (
select
	distinct transaction_date
from
	{{ source("raw_data", "sales_receipt") }}
)

select
	to_char(transaction_date, 'YYYYMMDD')::int as date_id,
	transaction_date,
	extract(week from transaction_date)::int as week_id,
	concat('Week ', extract(week from transaction_date)) as week_desc,
	extract(month from transaction_date)::int as month_id,
	TO_CHAR(transaction_date,'Month') as month_name,
	extract(quarter from transaction_date)::int as quarter_id,
	concat('Q', extract(quarter from transaction_date)) as quarter_name,
	extract(year from transaction_date)::int as year_id
from
	distinct_tr