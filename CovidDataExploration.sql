
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


/* A.
1. Total Cases: Retrieving the total number of COVID-19 cases reported. */

SELECT SUM(total_cases) AS Total_Cases
FROM project1.coviddata;


/*2. Cases by Continent: Listing the countries with the highest number of COVID-19 cases, sorted in descending order.*/
SELECT continent, SUM(total_cases) AS Total_cases
FROM project1.coviddata
GROUP BY continent
ORDER BY Total_cases DESC;


/* 3. Deaths by Continent: Displaing the countries with the highest number of COVID-19 deaths, sorted in descending order.*/
SELECT continent, SUM(total_deaths) AS Total_deaths
FROM project1.coviddata
GROUP BY continent
ORDER BY Total_deaths DESC;

/* 4. Smoker Recovery Rate: Calculating the percentage of recoveries who are smokers.*/
SELECT continent, (SUM(female_smokers) + SUM(male_smokers)) / NULLIF(Sum(total_cases - total_deaths), 0) AS percentage_recoveries_smokers
FROM project1.coviddata
GROUP BY continent;


/* 5. Diaetic Recovery Rate: Calculating the percentage of recoveries who suffer from diabetes.*/
SELECT continent, (SUM(diabetes_prevalence)/100) / NULLIF(Sum(total_cases - total_deaths), 0) AS percentage_recoveries_diabetics
FROM project1.coviddata
GROUP BY continent;


/* 6. Daily New Cases: Find the number of new COVID-19 cases reported each day */
SELECT AVG(new_cases) AS daily_new_cases
FROM project1.coviddata;

/* 7. Growth Rate: Compute the daily growth rate of COVID-19 cases globally.*/
SELECT AVG((new_cases/total_cases)*100) AS daily_growth_rate
FROM project1.coviddata;


/* 8. Cases by Country: List the countries with the highest number of COVID-19 cases, sorted in descending order.*/
SELECT Location, SUM(total_cases) AS total
FROM project1.coviddata
GROUP BY Location
ORDER BY total DESC;

/* 9. Testing Rate: Determine the testing rate (number of tests conducted per million population) for each country.*/
SELECT Location, total_tests, population, (total_tests/population)*1000000 AS testing_rate_perM
FROM project1.coviddata;


-- 10. Hospitalization Rate: Calculate the hospitalization rate (percentage of cases requiring hospitalization) for each country.
SELECT location, total_cases, hosp_patients, (hosp_patients/total_cases)*100 AS hosp_rate
FROM project1.coviddata;




