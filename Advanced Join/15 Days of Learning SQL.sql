with f as(
select submission_date, hacker_id, row_number()
over(partition by submission_date order by count(*) desc, hacker_id) rnk
from submissions
group by submission_date, hacker_id),
j as (
    select f.hacker_id, name, submission_date
    from f
    join hackers h on f.hacker_id = h.hacker_id
    where rnk = 1
),
     k as (
         select hacker_id,submission_date,
                row_number() over(partition by hacker_id order by submission_date) hrank,
                dense_rank() over (order by submission_date) drank
         from submissions
         group by submission_date, hacker_id
     )
select j.submission_date, count(distinct case when hrank=drank then s.hacker_id end), j.hacker_id, j.name
from k s
join j on s.submission_date = j.submission_date
group by j.submission_date, j.hacker_id, j.name
order by j.submission_date
