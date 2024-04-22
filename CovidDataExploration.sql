
USE project1;

/* 1.*/

SELECT SUM(new_cases) AS total_cases, SUM(CAST(new_deaths AS SIGNED)) AS total_deaths, SUM(CAST(new_deaths AS SIGNED))/SUM(New_Cases)*100 AS DeathPercentage
FROM project1.coviddata
WHERE continent IS NOT NULL 
ORDER BY 1,2;


/* 2.*/

SELECT location, SUM(CAST(new_deaths AS SIGNED)) AS TotalDeathCount
FROM project1.coviddata
WHERE continent IS NOT NULL 
AND location NOT IN ('World', 'European Union', 'International')
GROUP BY location
ORDER BY TotalDeathCount DESC;


/* 3.*/

SELECT Location, Population, MAX(total_cases) AS HighestInfectionCount,  Max((total_cases/population))*100 AS PercentPopulationInfected
FROM project1.coviddata
GROUP BY Location, Population
ORDER BY PercentPopulationInfected DESC;


/* 4.*/


SELECT Location, Population,date, MAX(total_cases) AS HighestInfectionCount,  Max((total_cases/population))*100 AS PercentPopulationInfected
FROM project1.coviddata
GROUP BY Location, Population, date
ORDER BY PercentPopulationInfected DESC;