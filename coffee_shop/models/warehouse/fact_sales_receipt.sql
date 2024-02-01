select
  ROW_NUMBER() OVER (order by null)::integer as transaction_id,
  to_char(transaction_date, 'YYYYMMDD')::int as date_id,
  staff_id,
  sales_outlet_id,
  customer_id,
  product_id,
  transaction_time::time,
  quantity,
  line_item_amount,
  unit_price,
  promo_item_yn,
  instore_yn
from
  {{ source('raw_data', 'sales_receipt') }}
where quantity > 0
