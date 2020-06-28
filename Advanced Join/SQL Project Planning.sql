select min(Start_Date), max(End_Date)
from (
select *, dateadd(day,-row_number() over(order by End_Date),End_Date) as rnk
from Projects
        )d
group by rnk
order by count(*),min(Start_Date)
