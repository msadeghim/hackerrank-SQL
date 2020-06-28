select convert(integer,ceiling(avg(1.0*salary)- avg(convert(float,replace(convert(varchar,salary),'0',''))))) 
from employees
