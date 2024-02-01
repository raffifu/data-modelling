with
product_sold as (
select
	product_id,
	SUM(quantity) as total_qty
from
	{{ ref("fact_sales_receipt") }} sr
left join
	{{ ref("dim_date") }} dd 
on
	sr.date_id = dd.date_id
where
	dd.transaction_date between '2019-04-06' and '2019-04-14'
group by
	product_id 
),
type_sold as (
select
	product_type,
	SUM(coalesce(total_qty, 0)) as total_qty
from
	{{ ref("dim_product") }} p
left join
	product_sold ps
on
	p.product_id = ps.product_id
group by
	1
)

select
	product_type,
	total_qty,
	case
		when total_qty >= 2000 then 'High Sold'
		when total_qty >= 1000 then 'Medium Sold'
		else 'Low Sold'
	end status_sold
from
	type_sold
order by
	total_qty desc