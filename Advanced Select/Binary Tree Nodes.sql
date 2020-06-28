select n, case when p is null then 'Root'
          when exists(select * from bst where p=b.n) then 'Inner'
          else 'Leaf' end
from bst b
order by n;


select n, 
       case when p is null then 'Root'
            when d.q is null then 'Leaf'
            else 'Inner' end
from bst b
left join (select distinct p from bst) d(q)
on b.n = d.q
order by n
