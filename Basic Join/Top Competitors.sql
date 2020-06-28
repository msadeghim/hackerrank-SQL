select h.hacker_id, h.name
from Submissions s
join Challenges ch
on s.challenge_id = ch.challenge_id
join Difficulty d
on ch.difficulty_level = d.difficulty_level
join Hackers h
on s.hacker_id = h.hacker_id
where s.score = d.score
group by h.hacker_id, h.name
having count(*)>1
order by count(*) desc, h.hacker_id
