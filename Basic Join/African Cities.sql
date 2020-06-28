select c.name
from city c
join country c2 
on c.countrycode = c2.code
where continent='Africa'
