/* Exercise 1   no 1  */
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
/*Exercise 2   no 1   */
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
/* quiz 2  */
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
/* Exercise 3  no 1  */
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950;
/* 2  */
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'
/* 3  */
SELECT yr, subject FROM nobel WHERE winner = 'Albert Einstein';
/* 4  */
SELECT winner FROM nobel WHERE yr >= 2000 AND subject = 'Peace';
/* 5  */
SELECT * FROM nobel WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989;
/* 6  */
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                   'Barack Obama' )
/*  7 */
SELECT winner FROM nobel WHERE winner LIKE 'John %'
/* 8  */
SELECT * FROM nobel WHERE (subject = 'Physics' AND yr = 1980) OR (subject = 'Chemistry' AND yr = 1984);
/*  9 */
SELECT * FROM nobel WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine');
/* 10  */
SELECT * FROM nobel WHERE (yr<1910 AND subject = 'Medicine') OR  (subject = 'Literature' AND yr >= 2004);
/*  11 */
SELECT * FROM nobel WHERE winner = 'PETER GRÜNBERG';
/* 12  */
SELECT * FROM nobel WHERE winner = 'EUGENE O''NEILL';
/* 13  */
SELECT winner, yr, subject FROM nobel WHERE winner LIKE 'Sir %' ORDER BY yr DESC;
/* 14  */
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'), subject, winner;
/* Quiz no 3  */
SELECT winner FROM nobel
 WHERE winner LIKE 'C%' AND winner LIKE '%n'
/* 2  */
SELECT COUNT(subject) FROM nobel
 WHERE subject = 'Chemistry'
   AND yr BETWEEN 1950 and 1960
/* 3  */
SELECT COUNT(DISTINCT yr) FROM nobel
 WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine')
/* 4  */
Medicine	Sir John Eccles
Medicine	Sir Frank Macfarlane Burnet
/* 5  */
SELECT yr FROM nobel
 WHERE yr NOT IN(SELECT yr 
                   FROM nobel
                 WHERE subject IN ('Chemistry','Physics'))
/* 6  */
SELECT yr FROM nobel
 WHERE yr NOT IN(SELECT subject
                 FROM nobel
                WHERE subject IN ('Chemistry','Physics'))
/* 7  */
SELECT DISTINCT yr
  FROM nobel
 WHERE subject='Medicine' 
   AND yr NOT IN(SELECT yr FROM nobel 
                  WHERE subject='Literature')
   AND yr NOT IN (SELECT yr FROM nobel
                   WHERE subject='Peace')
/* Exercise 4   no 1  */
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')
/* 2  */
SELECT name FROM world WHERE continent = 'Europe' AND gdp/population > (SELECT gdp/population FROM world WHERE name = 'United Kingdom');
/* 3  */
SELECT name, continent FROM world WHERE continent = (SELECT continent FROM world WHERE name = 'Australia') OR continent = (SELECT continent FROM world WHERE name = 'Argentina') ORDER bY name;
/*  4 */
SELECT name, population FROM world WHERE population > (SELECT population FROM world WHERE name = 'Canada') AND population < (SELECT population FROM world WHERE name = 'Poland')
/* 5  */
SELECT name, CONCAT(ROUND(population/(SELECT population FROM world WHERE name = 'Germany')*100) ,'%') FROM world WHERE continent = 'Europe';
/* 6  */
SELECT name
  FROM world
 WHERE population >= ALL(SELECT population
                           FROM world
                          WHERE population>0)
/* 7  */
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)

/* 8  */
SELECT continent, name FROM world x WHERE name <= ALL(SELECT name FROM world y WHERE name IS NOT NULL AND x.continent = y.continent)
/*  9 */
SELECT name, continent, population FROM world x WHERE 25000000>=ALL(SELECT population FROM world y WHERE x.continent = y.continent )
/* 10  */
SELECT name, continent FROM world x WHERE population/3>=ALL(SELECT population FROM world y WHERE x.continent = y.continent AND population IS NOT NULL AND x.name <> y.name ) AND population IS NOT NULL;
/* QUIZ 4   no 1   */
 SELECT region, name, population FROM bbc x WHERE population <= ALL (SELECT population FROM bbc y WHERE y.region=x.region AND population>0)
/* 2  */
 SELECT name,region,population FROM bbc x WHERE 50000 < ALL (SELECT population FROM bbc y WHERE x.region=y.region AND y.population>0)
/* 3  */
SELECT name, region FROM bbc x
 WHERE population < ALL (SELECT population/3 FROM bbc y WHERE y.region = x.region AND y.name != x.name)
/* 4  */
Table-D
France
Germany
Russia
Turkey
/*  5 */
SELECT name FROM bbc
 WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa')
/* 6  */
SELECT name FROM bbc
 WHERE population < (SELECT population FROM bbc WHERE name='Russia')
   AND population > (SELECT population FROM bbc WHERE name='Denmark')
/* 7  */
Table-B
Bangladesh
India
Pakistan
/* Exercise 5  no 1   */
SELECT SUM(population)
FROM world
/* 2  */
SELECT DISTINCT continent FROM world 
/* 3  */
SELECT SUM(gdp) FROM world WHERE continent = 'Africa';
/* 4  */
SELECT COUNT(name) FROM world WHERE area >1000000;
/* 5  */
SELECT SUM(population) FROM world WHERE name IN ('Estonia', 'Latvia', 'Lithuania');
/*  6 */
SELECT continent, COUNT(DISTINCT name) FROM world GROUP BY continent;
/* 7  */
SELECT continent, COUNT(DISTINCT name) FROM world WHERE population > 10000000 GROUP BY continent;
/* 8  */
SELECT continent FROM world  GROUP BY continent HAVING SUM(population)>100000000;
/* Quiz  no 1  */
 SELECT name, population FROM bbc WHERE region = 'Europe'
/* 2  */
 SELECT COUNT(name) FROM bbc WHERE population < 150000
/* 3  */
AVG(), COUNT(), MAX(), MIN(), SUM()
/* 4  */
No result due to invalid use of the WHERE function
/*  5 */
 SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark')
/* 6  */
 SELECT region, SUM(population)/SUM(area) AS density FROM bbc GROUP BY region
/* 7  */
 SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)
/* 8  */
Table-D
Americas	732240
Middle East	13403102
South America	17740392
South Asia	9437710
/* Exercise 6  */

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

/*   */

/*   */

/*   */