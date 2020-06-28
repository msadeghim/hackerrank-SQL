select c.company_code, c.founder,
        count(distinct lead_manager_code),
        count(distinct senior_manager_code),
        count(distinct manager_code),
        count(distinct employee_code)
from Employee as e 
inner join Company as c
on e.company_code = c.company_code
group by c.company_code, c.founder
order by c.company_code
