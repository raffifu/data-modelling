select
    manager as staff_id,
    sales_outlet_id
FROM
    {{ source('raw_data', 'sales_outlet') }}