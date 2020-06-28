with numbers(n) as 
(
    select 2
    union all
    select n+1 from numbers
    where n < 1000
), primes as
(
select cast(n as varchar(max)) as n,row_number() over(order by n) as rnk from numbers n1
where (select count(*) from numbers n2 where n2.n <= sqrt(n1.n) and (n1.n % n2.n=0)  ) = 0
), concat(rnk,c) as
(
    select rnk, CONVERT(VARCHAR(4000), n+'') from primes where rnk=1
    union all
    select primes.rnk, CONVERT(VARCHAR(4000), c+'&'+primes.n) from primes join concat on primes.rnk = concat.rnk+1
)
select top(1) c from concat order by rnk desc
option (maxrecursion 0);
