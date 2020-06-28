select sum(city.population) as d
from city
inner join country 
on city.countrycode = country.code
where country.continent='asia';
