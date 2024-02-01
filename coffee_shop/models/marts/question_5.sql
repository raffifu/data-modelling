with
total_transaction as (
select
	product_id,
	sum(quantity) as total_quantity
from
	{{ ref('fact_sales_receipt') }} sr
left join
	{{ ref('dim_date') }} dd 
on
	sr.date_id = dd.date_id
where
	dd.transaction_date between '2019-04-11' and '2019-04-19'
group by
	1
order by
	2 desc
limit 10
)

select
	tt.product_id,
	p.product
from
	total_transaction tt
left join
	{{ ref('dim_product') }} p
on
	tt.product_id = p.product_id