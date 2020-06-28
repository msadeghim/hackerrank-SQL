select s.Name
from Students s 
join Friends f on s.ID = f.ID
join Packages ps on f.ID = ps.ID
join Packages pf on f.Friend_id = pf.ID
where pf.Salary > ps.Salary
order by pf.Salary
