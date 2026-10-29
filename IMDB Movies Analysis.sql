use project_movie_database;
select*from directors;
select*from movies;
select count(*) as total_rows,
    sum(name is null) as null_name,
    sum(id is null) as null_id,
    sum(gender is null) as null_gender,
    sum(department is null) as null_department
from directors;
select count(*) as total_rows,
    sum(id is null) as null_id,
    sum(original_title is null) as null_original_title,
    sum(budget is null) as null_budget,
    sum(popularity is null) as null_popularity,
    sum(release_date is null) as null_release_date,
    sum(revenue is null) as null_revenue,
    sum(title is null) as null_title,
    sum(vote_average is null) as null_vote_average,
    sum(vote_count is null) as null_vote_count,
    sum(overview is null) as null_overview,
    sum(tagline is null) as null_tagline,
    sum(uid is null) as null_uid,
    sum(director_id is null) as null_director_id
from movies;
select * from directors;
select count(name) as Director_Total 
from directors;
select count(title) as Total_Movies 
from movies;
select * from directors 
where name IN  ('James Cameron','Luc Besson','John Woo');
select * from directors 
where name like ('S%');
select count(*) as Female_Directors
from directors
where gender = 1;
select name
from directors
where gender = 1
order by id
limit 10;
select title,vote_average,popularity
from movies
order by popularity desc 
limit 3;
select title,budget,revenue,(revenue-budget) as profit
from movies
order by profit desc 
limit 3;
select title,release_date,vote_average,vote_count
from movies
where release_date >= '2000-01-01'
order by vote_average desc
limit 3;
select m.title, m.release_date, d.name as director
from movies m
join directors d on m.director_id = d.id
where d.name = 'Brenda Chapman';
select d.name, count(*) as Movie_Count
from movies m
join directors d on m.director_id = d.id
group by d.id,d.name
order by Movie_Count desc
limit 1;
select d.name,m.title, sum(m.revenue-m.budget) as Total_profit
from movies m
join directors d on m.director_id = d.id
group by d.id,d.name,m.title
order by Total_profit desc
limit 1;
