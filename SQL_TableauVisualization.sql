--Sheet 1 
select SUM(new_cases) as totalcases,SUM(cast(new_deaths as int))as totaldeaths,SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
from Portfolio..CD
where continent is not null
--group by date
order by 1,2




--Sheet 2 

select location, SUM(cast(new_deaths as int))as TotalDeathCount
from Portfolio..CD
where continent is null
and location not in('World','european Union','International')
Group by location
order by TotalDeathCount desc

--Sheet 3

select location,Population,MAX(total_cases)as HighestInfectionCount, max(total_cases/population)*100 as PercentageHIC
from Portfolio..CD
group by location,Population
order by PercentageHIC  desc


--Sheet 4

select location,Population,date,MAX(total_cases)as HighestInfectionCount, max(total_cases/population)*100 as PercentageHIC
from Portfolio..CD
group by location,Population,date
order by PercentageHIC  desc
