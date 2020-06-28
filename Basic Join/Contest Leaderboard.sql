select hacker_id,name,sum(mx_score) s
from (
    select h.*, challenge_id,max(score) mx_score
    from Hackers h
    join Submissions s
    on s.hacker_id=h.hacker_id
    group by h.hacker_id,h.name,s.challenge_id 
) d
group by hacker_id,name
having sum(mx_score) > 0
order by s desc,hacker_id asc;
