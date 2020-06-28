select id, age, coins_needed, power
from (
select wp.age, w.*, row_number() over(partition by w.code,power order by coins_needed) as rnk
from Wands w 
join Wands_Property wp on w.code = wp.code
where is_evil = 0
)d
where rnk = 1
order by power desc, age desc
