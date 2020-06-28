select cast(avg(lat_n) as decimal(10,4))
from 
(
select lat_n,row_number() over(order by lat_n) rnk,
        count(*) over() as cnt
    from station
)d
where rnk = cnt/2+1
or rnk = ceiling(cnt/2.0)
