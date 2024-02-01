select
    ROW_NUMBER() OVER(ORDER BY NULL)::int as sales_target_id,
    sales_outlet_id,
    year_month,
    beans_goal,
    beverage_goal,
    food_goal,
    merchandise_goal,
    total_goal
from
    {{ source('raw_data', 'sales_target') }}