with cte as (
    select max(months*salary) mx
    from employee
)
select max(mx), count(*)
from employee e
join cte c on months*salary = c.mx
