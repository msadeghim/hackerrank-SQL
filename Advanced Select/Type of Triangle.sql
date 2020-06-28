select case when A = B and B = C then 'Equilateral' 
            when A <> B and B <> C and A <> C and A+B > C then 'Scalene'
            when( A = B or A = C or B = C )and (A+B > C ) then 'Isosceles'
            else 'Not A Triangle' end 
from TRIANGLES
