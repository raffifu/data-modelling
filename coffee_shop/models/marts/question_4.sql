with
total_qty as (
select
	distinct transaction_date,
	customer_id,
	SUM(quantity) as total_per_user
from
	{{ ref("fact_sales_receipt") }} sr
left join
	{{ ref("dim_date") }} dd 
on
	sr.date_id = dd.date_id
where
	dd.transaction_date between '2019-04-12' and '2019-04-20'
	and customer_id > 0
group by
	1,
	2
),
largest_qty_customer as (
select
	transaction_date,
	customer_id,
	row_number() over(partition by transaction_date
order by
	total_per_user desc) as rn
from
	total_qty
)

select 
	lqc.customer_id,
	customer_firstname,
	customer_email,
	transaction_date
from
	largest_qty_customer lqc
left join
    {{ ref("dim_customer") }} c 
on
	lqc.customer_id = c.customer_id
where
	rn = 1
order by
	transaction_date desc