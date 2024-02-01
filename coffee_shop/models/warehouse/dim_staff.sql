select
    staff_id,
    first_name,
    last_name,
    position,
    TO_DATE(start_date, 'MM/DD/YYYY') as start_date,
    location
from
	{{ source("raw_data", "staff") }}
