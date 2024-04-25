/* 1 */
SELECT SUM(new_cases) as TotalCases,  SUM(CAST(new_deaths as SIGNED)) AS TotalDeaths, SUM(CAST(new_deaths as SIGNED))/SUM(new_cases)*100 AS DeathPercentage
FROM project1.coviddata
where continent IS NOT NULL
ORDER BY 1,2;

/* 2 */

SELECT location, SUM(CAST(new_deaths AS SIGNED)) AS TotalDeathCount
FROM project1.coviddata
WHERE continent IS NOT NULL 
AND location NOT IN ("World", "European Union", "International")
GROUP BY location
ORDER BY TotalDeathCount DESC;

/* 3 */

SELECT Location, Population, MAX(total_cases) AS HighestInfectionCount,  MAX((total_cases/population))*100 as PercentPopulationInfected
FROM project1.coviddata
GROUP BY Location, Population
ORDER BY PercentPopulationInfected DESC;

/* 4 */

SELECT Location, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
FROM project1.coviddata
GROUP BY Location, Population, date
ORDER BY PercentPopulationInfected DESC;



