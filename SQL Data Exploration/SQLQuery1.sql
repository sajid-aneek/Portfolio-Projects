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

-- Showing the countries with the Highest Death count per Population

SELECT 
    Location, MAX(CAST (total_deaths as int )) as TotalDeathCount
FROM 
    PortfolioProject..CovidDeaths
--WHERE location like '%canada%'
where continent is not null
group by location
order by TotalDeathCount desc