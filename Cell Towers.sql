-- This is just an example of how insights can be generated from data
-- The dataset used in this has been taken from Kaggle.
-- The link to the dataset is https://www.kaggle.com/datasets/mattop/cellular-towers-in-the-united-states
-- The table has been named celltowers in the schema, which can be observed in the code below

select * from celltowers

-- statewise comparision of AT&T vs Verizon
select state, 
sum(license='AT&T') as ATT_Towers, sum(license='Verizon') as Verizon_Towers
from celltowers group by state 

-- specifics of all 12,272 cell towers AT&T has
select * from celltowers
where license='AT&T'
order by state

-- tower types that AT&T has
select tower_type, count(tower_type) from celltowers 
where license='AT&T' group by tower_type

-- check count of towers in each state 
select state, count(state) from celltowers 
where license='AT&T' group by state order by count(state) desc

-- lets go more into TX which has most cell towers at 1770 and their stats
select county, count(county) as No_of_Towers, avg(tower_height) as Avg_Tower_Height from celltowers
where license='AT&T' and state='TX'
group by county order by avg(tower_height) desc

-- lets go for a county based stats of AT&T
select county, count(tower_type) from celltowers 
where state='TX' group by county order by count(tower_type) desc

-- looking at other tandom factors like tower height
select * from celltowers 
where tower_height > (select avg(tower_height) from celltowers)
