select cast(sqrt(power(min(lat_n)-max(lat_n),2)+power(min(long_w)-max(long_w),2))as decimal(10,4)) from station
