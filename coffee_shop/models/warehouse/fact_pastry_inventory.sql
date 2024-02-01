select
    ROW_NUMBER() OVER(ORDER BY NULL)::int as pastry_inventory_id,
    sales_outlet_id,
    to_char(to_date(transaction_date, 'MM/DD/YYYY'), 'YYYYMMDD')::int as date_id,
    product_id,
    start_of_day,
    quantity_sold,
    waste,
    percent_waste
FROM
    {{ source('raw_data', 'pastry_inventory') }}