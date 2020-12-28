/* Exercise 0 1  */
SELECT population FROM world
  WHERE name = 'Germany'
/* 2  */
SELECT population FROM world
  WHERE name = 'Germany'
/* 3  */
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000
/* Qiuz 1  */
SELECT name, population
  FROM world
 WHERE population BETWEEN 1000000 AND 1250000
/*  2 */
Table-E
Albania	3200000
Algeria	32900000
/* 3  */
SELECT name FROM world
 WHERE name LIKE '%a' OR name LIKE '%l'
/* 4  */
name	length(name)
Italy	5
Malta	5
Spain	5
/* 5  */
Andorra	936
/* 6  */
SELECT name, area, population
  FROM world
 WHERE area > 50000 AND population < 10000000
/* 7  */
SELECT name, population/area
  FROM world
 WHERE name IN ('China', 'Nigeria', 'France', 'Australia')
/*Exercise 1   1   */
SELECT name, continent, population FROM world;
/* 2  */
SELECT name
  FROM world
 WHERE population > 200000000;
/* 3  */
SELECT name, gdp/population FROM world WHERE population > 200000000;
/* 4  */
SELECT name, population/1000000 FROM world WHERE continent = 'South America';
/* 5  */
SELECT name, population FROM world WHERE name IN ('France', 'Germany', 'Italy');
/* 6  */
SELECT name FROM world WHERE name LIKE '%United' OR name LIKE 'United%' OR name LIKE '%United%';
/* 7  */
SELECT name, population, area FROM world WHERE area > 3000000 OR population > 250000000;
/* 8  */
SELECT name, population, area FROM world WHERE area > 3000000 XOR population > 250000000;
/* 9  */
SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2) FROM world WHERE continent = 'South America';
/* 10 */
SELECT name , ROUND(ROUND(gdp/population, 0)/1000, 0)*1000 FROM world WHERE gdp/1000000000000 > 1;
/* 11  */
SELECT name, capital FROM world WHERE LENGTH(capital) = LENGTH(name);
/* 12  */
SELECT name, capital FROM world WHERE LEFT(name, 1) = LEFT(capital, 1) AND name != capital;
/* 13  */
SELECT name FROM world
    WHERE name LIKE '%a%'
    AND name NOT LIKE '% %'
    AND name LIKE '%e%'
    AND name LIKE '%i%'
    AND name LIKE '%o%'
    AND name LIKE '%u%';
/* quiz 1  */
SELECT name
  FROM world
 WHERE name LIKE 'U%'
/* 2  */
SELECT population
  FROM world
 WHERE name = 'United Kingdom'
/* 3  */
'name' should be name
/* 4  */
Nauru	990
/*  5 */
SELECT name, population
  FROM world
 WHERE continent IN ('Europe', 'Asia')
/* 6  */
SELECT name FROM world
 WHERE name IN ('Cuba', 'Togo')
/* 7  */
Brazil
Colombia
/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */

/*   */