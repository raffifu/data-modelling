select 
    customer_id,
    home_store,
    "customer_first-name" as customer_firstname,
    customer_email,
    customer_since,
    loyalty_card_number,
    birthdate,
    gender,
    birth_year,
    case 
        when birth_year <= 1964 then 'Baby Boomers'
        when birth_year <= 1979 then 'Gen X'
        when birth_year <= 1989 then 'Older Millennials'
        when birth_year <= 1994 then 'Younger Millennials'
        else'Gen Z'
    end generation
from 
{{ source("raw_data", "customer") }}
