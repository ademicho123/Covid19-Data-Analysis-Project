-- Seelct Data that we are going to be using
Select Location, date, total_cases, new_cases, total_deaths, population
From CovidDeaths
order by 1, 2

-- Shows the likelihood of dying from Covid

Select Location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From CovidDeaths
Where location like '%state%'
order by 1, 2

-- Looking at the Total Cases Vs The Population

Select Location, date, total_cases,Population, (total_cases/population)*100 as CasesPercentage
From CovidDeaths
Where location like '%state%'
order by 1, 2

-- Countries with Highest infection rate compare to the population

Select Location, Population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected
From CovidDeaths
--Where location like '%state%'
Group by Location, Population
order by PercentPopulationInfected desc

--Swhowing countries with Highest Death count per population

Select Location, Population, MAX(total_deaths) as HighestDeathCount, MAX((total_deaths/population))*100 as PercentPopulationInfected
From CovidDeaths
--Where location like '%state%'
Group by Location, Population
order by PercentPopulationInfected desc
