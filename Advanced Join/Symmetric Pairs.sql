with cte as 
(
    select *, row_number() over(order by x) as rnk
    from functions
)
select f1.x,f1.y 
from cte as f1
join cte as f2
on f1.x = f2.y and f1.y=f2.x where f1.rnk < f2.rnk;
