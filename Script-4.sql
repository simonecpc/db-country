-- 1
select *
from countries c 
where name like 'P%' and area > 1000;

-- 2
select *
from countries c 
where TIMESTAMPDIFF(year, national_day, curdate()) > 100;

-- 3
select r.name 
from regions r 
join continents c on r.continent_id = c.continent_id 
where c.continent_id = 4
order by r.name;

-- 4
select count(l.language_id) as numero_lingue
from languages l
join country_languages c_l
on l.language_id = c_l.language_id 
join  countries c
on c.country_id = c_l.country_id 
where c.name = 'Italy';

-- 5
select *
from countries c 
where national_day is null;

-- 6
select c.name, r.name, c2.name
from countries c 
inner join regions r on c.region_id = r.region_id 
inner join continents c2 on r.continent_id  = c2.continent_id ;

-- 7
update countries c
set national_day = '1946-06-02'
where c.name = 'Italy';

-- 8
select r.name, sum(c.area) as area_totale
from regions r
join countries c on r.region_id = c.region_id 
group by r.name ;

-- 9
select  c.name, l.`language`,cl.official
from languages l 
join country_languages cl on cl.language_id = l.language_id 
join countries c on cl.country_id = c.country_id
where c.name = 'Albania' and official = 1;

-- 10
select c.name, avg(cs.gdp) as gdp_medio
from country_stats cs 
join countries c ON cs.country_id = c.country_id 
where c.name = 'United Kingdom' and cs.`year` between 2000 and 2010 ;

-- 11
select l.`language` , c.name , c.area  
from languages l 
join country_languages cl on cl.language_id = l.language_id 
join countries c on cl.country_id = c.country_id 
where l.`language` like 'Hindi'
order by c.area desc ;

-- 12
select  c.name as continent, count(c2.country_id)
from continents c
join regions r
on c.continent_id = r.continent_id 
join countries c2
on c2.region_id = r.region_id 
where c2.area > 10000
group by continent
order by count(c2.country_id) desc;