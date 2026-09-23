/**
delete from t1;
insert into T1 values ('a',1);
insert into T1 values ('a',2);
insert into T1 values ('a',3);

insert into T1 values ('a',5);
insert into T1 values ('a',6);

insert into T1 values ('a',7);
insert into T1 values ('a',8);

insert into T1 values ('b',7);
insert into T1 values ('c',8);

select * from t1;
**/

select c1,c2
, ROW_NUMBER()  over (partition by C1 order by c1) as rn 
, dense_rank() over (partition by C1 order by c1, c2) as drnk 
, rank() over (partition by C1 order by c1, c2) as rnk 
--, lag (c2, 1, 0) lg
from t1;


select c1, c2, lag(c2, 1,0) over(partition by c1 order by c1, c2) lg
from t1
