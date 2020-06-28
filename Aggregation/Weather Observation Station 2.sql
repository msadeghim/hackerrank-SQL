select cast(sum (lat_n) as decimal(10,2)), cast(sum(long_w) as decimal(10,2))
from station
