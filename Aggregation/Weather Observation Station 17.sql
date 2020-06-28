/* smallest value greater than 38.7780 */

declare @temp float =(select min(lat_n) from station where lat_n>38.7780);

select CAST(LONG_W as DECIMAL(10,4))
from station
where lat_n = @temp;


select CAST(LONG_W as DECIMAL(10,4))
from station s
join (select min(lat_n) from station where lat_n > 38.7780) d(mi)
on s.lat_n = d.mi
