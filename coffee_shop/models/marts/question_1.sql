with
target_customer as (
select 
	customer_id
from
	{{ ref("dim_customer") }} c
where 
	customer_email = 'Charissa@Integer.us'
),
total_line_amount as (
select
	customer_id,
	transaction_date,
	SUM(line_item_amount) as total_amount
from
	{{ ref("fact_sales_receipt") }} sr
left join
	{{ ref("dim_date") }} dd 
on
	sr.date_id = dd.date_id
group by
	1,
	2
),
target_amount as (
select
		total_amount
from
		total_line_amount
where
	transaction_date = '2019-04-20'
	and 
		customer_id = (
	select
			*
	from
			target_customer)
)

select
	l.customer_id,
	customer_firstname,
	customer_email,
	transaction_date
from
	total_line_amount l
left join
	{{ ref("dim_customer") }} c 
on
	l.customer_id = c.customer_id
where
	total_amount = (
	select
		*
	from
		target_amount)
order by
	transaction_date desc