
select * from level_1 order by payload;
select * from level_2 order by payload;
select * from level_3 order by payload;

#Q1
(select l1.payload, l1.title
		from level_2 l2 LEFT JOIN
        level_1 l1 ON l2.level_1_id_fk = l1.level_1_id
		where l2.payload in ('bachelorofscience','masterofscience'))
UNION
(select payload, title
from level_1 l1
where (select count(level_1_id_fk) cnt
						from level_2 l2
						where l2.payload in ('bachelorofscience','masterofscience')) = 0);

# Q2
(select l2.payload, l2.title
		from level_3 l3 LEFT JOIN
        level_2 l2 ON l3.level_2_id_fk = l2.level_2_id
		where l3.payload in ('chemistry'))
UNION
(select payload, title
from level_2 l2
where (select count(level_2_id_fk) cnt
						from level_3 l3
						where l3.payload in ('chemistry')) = 0);


# Q3
select l3.payload, l3.title
from level_3 l3
where l3.level_2_id_fk in (select l2.level_2_id 
							from level_2 l2
							where l2.payload = 'masterofscience' and 
							l2.level_1_id_fk in (select l1.level_1_id 
												  from level_1 l1
                                                  where l1.payload = 'postgraduate'));

select l3.payload, l3.title
from level_3 l3 LEFT JOIN
     level_2 l2 ON l3.level_2_id_fk = l2.level_2_id LEFT JOIN
     level_1 l1 ON l2.level_1_id_fk = l1.level_1_id
where l1.payload = 'postgraduate' AND l2.payload = 'masterofscience';
     


# L1 Action
#L1     L2    L3
#0       0     0  => Run Q1 *
#0       1     0  => Run Q1 *
#0       0     1  => Run Q2, Run Q1 with result of Q2 *
#0       1     1  => Run Q2, Validate L2 value in Q2 Result set, if not present set l2 = None, Run Q1 with result of Q2 *

# L2 Action
#L1     L2    L3
#1       0     0  => Run Q2 *
#1       0     1  => Run Q2 *

-- #L3 Action
-- #L1     L2    L3
-- #1       1     0  => Run Q
