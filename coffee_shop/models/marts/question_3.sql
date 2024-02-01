with
qty_sold as (
select
	product_id,
	SUM(quantity) as total_sold
from
	{{ ref("fact_sales_receipt") }} sr
left join
	{{ ref("dim_date") }} dd 
on
	sr.date_id = dd.date_id
where
	dd.transaction_date = '2019-04-02'
group by
	1
)


select
	product_type,
	SUM(coalesce(total_sold, 0)) as total_qty_sold
from
	{{ ref("dim_product") }} p
left join
    qty_sold qs 
on
	qs.product_id = p.product_id
group by
	1
order by
	2 desc