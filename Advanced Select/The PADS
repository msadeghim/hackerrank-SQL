select name+'('+left(occupation,1)+')'
from occupations
order by name;

select "There are a total of "+cast(count(*) as varchar(50))+" "+lower(occupation)+"s."
from occupations
group by occupation
order by count(*), occupation;
