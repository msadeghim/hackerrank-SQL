select distinct city 
from station 
where right(city,1) not in ('a', 'e', 'i', 'o', 'u');


select distinct city 
from station 
where city like '%[^aeiou]'
