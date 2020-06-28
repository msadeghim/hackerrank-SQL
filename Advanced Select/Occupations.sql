select  max(case when occupation='Doctor' then name else null end),
        max(case when occupation='Professor' then name else null end),
        max(case when occupation='Singer' then name else null end),
        max(case when occupation='Actor' then name else null end)
from 
(
    select name,occupation, row_number() over(partition by occupation order by name) as t 
    from occupations
) 
group by t
order by t;
