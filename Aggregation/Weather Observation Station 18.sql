select cast((max(lat_n)-min (lat_n))+( max(long_w)-min(long_w)) as decimal(10,4))
from station
