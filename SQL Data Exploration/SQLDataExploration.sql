Select * 
From PortfolioProject..CovidDeaths
where continent is not null



Select * 
From PortfolioProject..CovidVacs
where continent is not null
order by 3,4

Select Location, date, total_cases, new_cases, total_deaths, population
From PortfolioProject..CovidDeaths
where continent is not null
order by 1,2

--Looking at Total Cases vs Total Deaths 
SELECT 
    Location, 
    date, 
    total_cases, 
    total_deaths, 
    (CAST(total_deaths AS float) / CAST(total_cases AS float))*100 AS death_rate_percentage
FROM 
    PortfolioProject..CovidDeaths
WHERE location like '%canada%'
and continent is not null

-- Shows what percentage of population has got covid
SELECT 
    Location, date, population, total_cases, (CAST(total_cases AS float) / CAST(population AS float))*100 AS PercentPopulationInfected
FROM 
    PortfolioProject..CovidDeaths
WHERE location like '%canada%'
and continent is not null
order by 1,2


--Looking at Countries with Highest Infection Rate compared to population 
SELECT 
    Location, Population, MAX(total_cases) as HighestInfectionCount, MAX((CAST(total_cases AS float) / CAST(population AS float)))*100 AS PercentPopulationInfected
FROM 
    PortfolioProject..CovidDeaths
--WHERE location like '%canada%'
where continent is not null
group by location, population
order by PercentPopulationInfected desc


-- Let's break things doen by continent

SELECT 
    location, MAX(CAST (total_deaths as int )) as TotalDeathCount
FROM 
    PortfolioProject..CovidDeaths
where continent is null
group by location
order by TotalDeathCount desc

-- Showing the countries with the Highest Death count per Population

SELECT 
    Location, MAX(CAST (total_deaths as int )) as TotalDeathCount
FROM 
    PortfolioProject..CovidDeaths
--WHERE location like '%canada%'
where continent is not null
group by location
order by TotalDeathCount desc

-- Showing continents with the highest death count per population
SELECT 
    continent, MAX(CAST (total_deaths as int )) as TotalDeathCount
FROM 
    PortfolioProject..CovidDeaths
where continent is not null
group by continent
order by TotalDeathCount desc

-- GLOBAL NUMBERS 
SELECT 
    SUM(new_cases) as total_cases, 
    SUM(cast(new_deaths as int)) as total_deaths, 
    CASE
        WHEN SUM(cast(new_cases as int)) = 0 THEN 0
        ELSE (CAST(SUM(cast(new_deaths as int)) AS FLOAT)/CAST(SUM(cast(new_cases as int)) AS FLOAT))*100
    END as DeathPercentage
FROM 
    PortfolioProject..CovidDeaths
WHERE 
    continent is not null


-- Looking at total population vs vaccinations

SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
SUM(CONVERT (bigint, vac.new_vaccinations)) OVER (Partition by dea.Location order by dea.location, dea.date) as Cumulative
--, (Cumulative/population)*100
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVacs vac
On dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null


-- USE CTE 
With PopvsVac (Continent, Location, Date, Population,new_vaccinations, Cumulative)
as (
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
SUM(CONVERT (bigint, vac.new_vaccinations)) OVER (Partition by dea.Location order by dea.location, dea.date) as Cumulative
--, (Cumulative/population)*100
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVacs vac
On dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null
)
SELECT *, (Cumulative/population)*100 as cumulative_percentage
from PopvsVac

-- TEMP TABLE

DROP Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime, 
Population numeric, 
New_vaccinations numeric, 
Cumulative numeric
)


Insert into #PercentPopulationVaccinated
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
SUM(CONVERT (bigint, vac.new_vaccinations)) OVER (Partition by dea.Location order by dea.location, dea.date) as Cumulative
--, (Cumulative/population)*100
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVacs vac
On dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null

SELECT *, (Cumulative/population)*100 as cumulative_percentage
from #PercentPopulationVaccinated

-- Creating view to store data for later visualizations 

Create View PercentPopulationVaccinated as 
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
SUM(CONVERT (bigint, vac.new_vaccinations)) OVER (Partition by dea.Location order by dea.location, dea.date) as Cumulative
--, (Cumulative/population)*100
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVacs vac
On dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null
