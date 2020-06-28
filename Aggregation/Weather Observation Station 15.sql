select cast(long_w as decimal(10,4)) 
from station 
where lat_n = (select max(lat_n) 
               from station 
               where lat_n<137.2345)
               
               
select cast(long_w as decimal(10,4)) 
from station s
join (select max(lat_n)
      from station
      where lat_n < 137.2345) d(mx) on s.lat_n = d.mx
