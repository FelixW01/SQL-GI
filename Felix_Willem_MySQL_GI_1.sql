-- Felix WIllem GI SQL Week 14

-- SELECT all data from the dataset.

USE sunshine;
SELECT *
FROM sunshine3;

-- City names that had exactly 314 hours of sunshine in June.

SELECT city
FROM sunshine3

WHERE Jun = 314;

-- Country and City names that had exactly 314 hours of sunshine in June.

SELECT country, city 
FROM sunshine3

WHERE jun = 314;

-- A list of all countries in the dataset.

SELECT country
FROM sunshine3

-- All information in the table for cities starting with “Ch”

SELECT *
FROM sunshine3

WHERE city LIKE 'ch%';

-- Cities that received a total amount of sunshine greater than 3,000 hours.

SELECT city
FROM sunshine3

WHERE year > 3000;

-- Cities that received a total amount of sunshine greater than 3,000 hours that are also in the United States.

SELECT city
FROM sunshine3

WHERE year > 3000
AND country = 'United States';


-- All information in the dataset where Country has no null values.

SELECT city
FROM sunshine3

WHERE year > 3000
AND country IS NOT NULL;

-- SELECT all data for Charlotte, Raleigh, and Atlanta.

SELECT *
FROM sunshine3

WHERE city IN('Charlotte', 'Raleigh', 'Atlanta');

-- The city and country for each location that receives between 5 and 20 hours of sunshine in January.

SELECT city, country
FROM sunshine3

WHERE Jan BETWEEN 5 AND 20;

-- The city and country for each location that receives between 5 and 20 hours of sunshine in January and over 300 hours of sunshine in June.

SELECT city, country
FROM sunshine3

WHERE Jan BETWEEN 5 AND 20
AND Jun > 300;

-- All cities in the dataset that are in the United States excluding Charlotte.

SELECT city
FROM sunshine3

WHERE country = 'United States'
AND city <> 'Charlotte';

-- All cities in the dataset that are in the United States excluding Charlotte, Boston, and Las Vegas.

SELECT city
FROM sunshine3

WHERE country = 'United States'
AND city NOT IN ('Charlotte', 'Boston', 'Las Vegas');

-- All information in the dataset for cities that have exactly 225 hours of sunshine in September or have at least 200 hours of sunshine in January.

SELECT *
FROM sunshine3

WHERE Sep= 225
AND Jan > 200;

-- All information in the dataset for cities in the United States that have exactly 225 hours of sunshine in September or have at least 200 hours of sunshine in January.

SELECT *
FROM sunshine3

WHERE country = 'United States'
AND (Sep = 225 OR Jan > 200);


-- Aggregate SELECT Problems

-- How many rows are in the data set?

SELECT COUNT(*)
FROM sunshine3;

-- What is the total hours of sunshine for cities in the United States in May?

SELECT COUNT(May)
FROM sunshine3

WHERE country = 'United States'

-- Find the city that is last in alphabetical order.

SELECT city
FROM sunshine3

ORDER BY city DESC
LIMIT 1;

-- What is the average hours of sunshine in January?

SELECT AVG(Jan)
FROM sunshine3;

-- Which is higher, the average hours of sunshine in July for the United States or Australia? Find this in one query.

SELECT country, AVG(Jul)
FROM sunshine3
WHERE country IN ('United States', 'Australia')
GROUP BY country
ORDER BY country DESC
LIMIT 1;

-- Count the countries in this dataset using a COUNT and COUNT DISTINCT. Interpret your results.

-- There are 137 distinct countries in this dataset
SELECT COUNT(DISTINCT country)
FROM sunshine3;

-- Return the top 10 countries with the highest average sunshine for the year (use the ‘Year’ column)

SELECT city, AVG(year) AS avg_year
FROM sunshine3
GROUP BY city
ORDER BY avg_year DESC
LIMIT 10;

-- Return the countries where we only have information about one city.

SELECT country
FROM sunshine3
GROUP BY country
HAVING COUNT(DISTINCT city) = 1;