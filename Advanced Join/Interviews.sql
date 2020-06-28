select contests.contest_id, contests.hacker_id, contests.name, sum(aa), sum(bb), sum(cc), sum(dd)
from Contests 
join Colleges on Contests.contest_id = Colleges.contest_id
join Challenges on Colleges.college_id = Challenges.college_id
left join (select challenge_id, sum(total_submissions) aa , sum(total_accepted_submissions) bb from submission_stats group by challenge_id) a
on challenges.challenge_id = a.challenge_id
left join (select challenge_id, sum(total_views) cc , sum(total_unique_views)dd from view_stats group by challenge_id) b
on challenges.challenge_id = b.challenge_id
group by contests.contest_id, contests.hacker_id, contests.name
having not(sum(aa)=0 and sum(bb)=0 and sum(cc)=0 and sum(dd)=0)
order by contests.contest_id
