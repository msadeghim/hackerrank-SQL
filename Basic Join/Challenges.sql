with c as 
(
    select h.hacker_id, name, cnt, 
    dense_rank() over(order by cnt desc) as dens_rnk,
    row_number() over(order by cnt desc) as row_rnk
    from
    (
        select hacker_id, count(*) cnt
        from Challenges 
        group by hacker_id
    )d
    join hackers h 
    on h.hacker_id = d.hacker_id
)
select hacker_id, name, cnt
from c where dens_rnk=1
union all
(
select min(hacker_id),min(name),min(cnt)
from c
where dens_rnk>1
group by dens_rnk    
having count(*)=1    
)
order by cnt desc

    
