/* SELECT basics  no 1  */
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
 /* SELECT NAMES 1   */
SELECT name FROM world
  WHERE name LIKE 'Y%'
/* 2  */
SELECT name FROM world
  WHERE name LIKE '%Y'
/*  3 */
SELECT name FROM world
  WHERE name LIKE '%x%' 
/*  4 */
SELECT name FROM world
  WHERE name LIKE '%land'
/* 5  */
SELECT name FROM world
  WHERE name LIKE 'c%' AND name LIKE '%ia'
/*  6 */
SELECT name FROM world
  WHERE name LIKE '%oo%'
/* 7  */
SELECT name FROM world
  WHERE name LIKE '%a%a%a%'
/* 8  */
SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name
/* 9  */
SELECT name FROM world
 WHERE name LIKE '%o__o%'
/*  10 */
SELECT name FROM world
WHERE LENGTH(name)=4
/* 11  */
SELECT a.name FROM world a JOIN world b ON a.name=b.capital
/* 12  */
SELECT name FROM world WHERE capital = CONCAT(name,' City')
/*  13 */
SELECT capital, name FROM world WHERE capital LIKE CONCAT(name, '%')
/* 14  */
SELECT capital, name FROM world WHERE capital LIKE CONCAT(name, '%') AND LENGTH(name)< LENGTH(capital)
/* 15  */
SELECT name, REPLACE(capital, name, '') FROM world WHERE capital LIKE CONCAT(name, '%') AND LENGTH(name)< LENGTH(capital)
/* SELECT FROM world  no 1   */
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
/* SELECT from nobel  no 1  */
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
/* Quiz 1  */
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
/* SELECT WITHIN SELECT 1  */
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
/* QUIZ  1 */
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
/* SUM AND COUNT 1   */
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
/* Quiz  1  */
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
/* JOIN 1 */
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'
/* 2  */
SELECT id,stadium,team1,team2
  FROM game WHERE id = 1012
/* 3  */
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (goal.matchid=game.id) WHERE teamid = 'GER';
/* 4  */
SELECT team1, team2, player FROM game JOIN goal ON (goal.matchid=game.id) WHERE player like 'Mario%'
/* 5  */
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam on teamid=id
 WHERE gtime<=10
/* 6  */
SELECT mdate, teamname FROM game JOIN eteam ON (team1=eteam.id) WHERE coach = 'Fernando Santos'
/* 7  */
SELECT player FROM game JOIN goal ON (matchid=id) WHERE stadium = 'National Stadium, Warsaw';
/* 8  */
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' OR team2='GER') AND teamid <> 'GER' 
/* 9  */
SELECT teamname, COUNT(player)
  FROM eteam JOIN goal ON id=teamid GROUP BY teamname
/* 10  */
SELECT stadium, COUNT(player)
FROM game JOIN goal ON matchid = id GROUP BY stadium
/* 11  */
SELECT matchid, mdate, COUNT(player)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL') GROUP BY matchid, mdate
/*  12 */
SELECT matchid, mdate, COUNT(player)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'GER' OR team2 = 'GER') AND teamid = 'GER' GROUP BY matchid, mdate
/* 13  */
SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) AS score1,
team2,
SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) AS score2
  FROM game LEFT JOIN goal ON matchid = id
GROUP BY mdate, team1, team2 ORDER BY mdate,matchid,team1,team2
/* Quiz 1  */
 game  JOIN goal ON (id=matchid)
/*  2 */
 matchid, teamid, player, gtime, id, teamname, coach
/* 3  */
SELECT player, teamid, COUNT(*)
  FROM game JOIN goal ON matchid = id
 WHERE (team1 = "GRE" OR team2 = "GRE")
   AND teamid != 'GRE'
 GROUP BY player, teamid
/* 4  */
DEN	9 June 2012
GER	9 June 2012
/* 5  */
  SELECT DISTINCT player, teamid 
   FROM game JOIN goal ON matchid = id 
  WHERE stadium = 'National Stadium, Warsaw' 
 AND (team1 = 'POL' OR team2 = 'POL')
   AND teamid != 'POL'
/*  6 */
SELECT DISTINCT player, teamid, gtime
  FROM game JOIN goal ON matchid = id
 WHERE stadium = 'Stadion Miejski (Wroclaw)'
   AND (( teamid = team2 AND team1 != 'ITA') OR ( teamid = team1 AND team2 != 'ITA'))
/* 7  */
Netherlands	2
Poland	2
Republic of Ireland	1
Ukraine	2
/* More JOIN 1 */
SELECT id, title
 FROM movie
 WHERE yr=1962
/* 2  */
SELECT yr FROM movie WHERE title ='Citizen Kane'
/* 3  */
SELECT id, title, yr FROM movie WHERE title LIKE 'Star Trek%' ORDER BY yr
/* 4  */
SELECT id FROM actor WHERE name = 'Glenn Close'
/* 5  */
SELECT id FROM movie WHERE title = 'Casablanca'
/*  6 */
SELECT name FROM actor JOIN casting ON id = actorid WHERE movieid = 11768
/* 7  */
 SELECT name FROM actor JOIN casting ON id = actorid WHERE movieid =(SELECT id FROM movie WHERE title = 'Alien')
/* 8  */
SELECT title FROM movie JOIN casting ON id = movieid  WHERE actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford') 
/* 9  */
SELECT title FROM movie JOIN casting ON id = movieid  WHERE actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford') AND ord>1
/*  10 */
SELECT title, name FROM movie JOIN casting on id=movieid 
                    JOIN actor ON actor.id = actorid
                    WHERE yr =1962 AND ord = 1;
/* 11  */
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2
/* 12  */
SELECT title, name 
FROM movie JOIN casting ON (movie.id = casting.movieid) 
           JOIN actor ON (actor.id = casting.actorid)
WHERE movieid IN (SELECT movieid 
                  FROM casting JOIN actor ON (actor.id = casting.actorid)
                  WHERE name = 'Julie Andrews') 
                  AND ord = 1
/* 13  */
SELECT name FROM actor 
  WHERE id IN (SELECT actorid FROM casting WHERE ord =1
               GROUP BY actorid HAVING 
               COUNT(actorid)>=15) 
               ORDER BY name
/* 14  */
SELECT title, COUNT(actorid) FROM casting
  JOIN movie ON movieid = movie.id
  WHERE yr = 1978
  GROUP BY movieid, title
  ORDER BY COUNT(actorid) DESC, title
/* 15  */
SELECT name FROM actor JOIN casting ON actorid=id WHERE movieid IN (  SELECT movieid FROM casting JOIN actor ON id=actorid   WHERE  actorid = (SELECT id FROM actor WHERE name='Art Garfunkel')) AND name !='Art Garfunkel'
/* Quiz 1  */
SELECT name
  FROM actor INNER JOIN movie ON actor.id = director
 WHERE gross < budget
/* 2  */
SELECT *
  FROM actor JOIN casting ON actor.id = actorid
  JOIN movie ON movie.id = movieid
/*  3 */
SELECT name, COUNT(movieid)
  FROM casting JOIN actor ON actorid=actor.id
 WHERE name LIKE 'John %'
 GROUP BY name ORDER BY 2 DESC
/*  4 */
Table-B
"Crocodile" Dundee
Crocodile Dundee in Los Angeles
Flipper
Lightning Jack
/* 5  */
SELECT name
  FROM movie JOIN casting ON movie.id = movieid
  JOIN actor ON actor.id = actorid
WHERE ord = 1 AND director = 351
/* 6  */
link the director column in movies with the primary key in actor
connect the primary keys of movie and actor via the casting table
/*  7 */
Table-B
A Bronx Tale	1993
Bang the Drum Slowly	1973
Limitless	2011
/* Using NULL  1  */
SELECT name FROM teacher WHERE dept IS NULL
/*  2 */
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)
/* 3  */
SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)
/* 4  */
SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)
/* 5  */
SELECT name,COALESCE(mobile,'07986 444 2266') FROM teacher 
/* 6  */
SELECT teacher.name, COALESCE(dept.name,'None')
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)
/*  7 */
SELECT COUNT(name), COUNT(mobile) FROM teacher
/*  8 */
SELECT dept.name, COUNT(teacher.name) FROM dept LEFT JOIN teacher ON (teacher.dept=dept.id) GROUP BY dept.name
/* 9  */
SELECT name,CASE
  WHEN dept= 1 THEN 'Sci'
  WHEN dept= 2 THEN 'Sci'
ELSE 'Art'
END
  FROM teacher
/* 10  */
SELECT name,CASE
  WHEN dept= 1 THEN 'Sci'
  WHEN dept= 2 THEN 'Sci'
  WHEN dept= 3 THEN 'Art'
ELSE 'None'
END
  FROM teacher
/* Quiz 1  */
 SELECT teacher.name, dept.name FROM teacher LEFT OUTER JOIN dept ON (teacher.dept = dept.id)
/*  2 */
 SELECT dept.name FROM teacher JOIN dept ON (dept.id = teacher.dept) WHERE teacher.name = 'Cutflower'
/* 3  */
 SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON dept.id = teacher.dept GROUP BY dept.name
/* 4  */
display 0 in result column for all teachers without department
/* 5  */
'four' for Throd
/* 6  */
Table-A
Shrivell	Computing
Throd	Computing
Splint	Computing
Spiregrain	Other
Cutflower	Other
Deadyawn	Other
/*  SELF JOIN 1  */
SELECT COUNT(* )FROM stops
/* 2  */
SELECT id FROM stops WHERE name='Craiglockhart'
/* 3  */
SELECT id, name FROM stops JOIN route ON id=stop WHERE company='LRT' AND num='4'
/* 4  */
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num HAVING COUNT(*)=2
/* 5  */
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop=(SELECT id FROM stops WHERE name='London Road')
/* 6  */
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='London Road'
/* 7  */
SELECT DISTINCT a.company, a.num FROM route a JOIN route b ON a.num=b.num WHERE a.stop=115 AND b.stop = 137 
/*  8 */
SELECT distinct a.company, a.num
FROM route a JOIN route b ON 
(a.num = b.num)
join stops stopa on (a.stop=stopa.id)
join stops stopb on (b.stop=stopb.id) WHERE stopa.name= 'Craiglockhart' AND stopb.name='Tollcross'
/* 9  */
SELECT stopb.name, a.company, a.num 
  FROM route a JOIN route b 
                 ON (a.num=b.num AND a.company=b.company) 
               JOIN  stops stopa ON (stopa.id=a.stop) 
               JOIN stops stopb ON (stopb.id=b.stop) 
               WHERE stopa.name= 'Craiglockhart'
/* 10  */

/* Quiz 1  */

/*   */

/*   */

/*   */

/* nss query  1  */
SELECT A_STRONGLY_AGREE
  FROM nss
 WHERE question='Q01'
   AND institution='Edinburgh Napier University'
   AND subject='(8) Computer Science'
/*  2 */
SELECT institution, subject
  FROM nss
 WHERE question='Q15'
   AND score>=100
/* 3  */
SELECT institution,score
  FROM nss
 WHERE question='Q15'
   AND score<50
   AND subject='(8) Computer Science'
/* 4  */
SELECT subject, SUM(response)
  FROM nss
 WHERE question='Q22'
   AND subject IN ('(8) Computer Science', '(H) Creative Arts and Design')
GROUP BY subject
/* 5  */
SELECT subject, SUM((A_STRONGLY_AGREE/100)*response)
  FROM nss
 WHERE question='Q22'
   AND (subject='(H) Creative Arts and Design'
   OR subject='(8) Computer Science')
GROUP BY subject
/* 6  */
SELECT subject, ROUND(SUM((A_STRONGLY_AGREE)*response)/SUM(response))
  FROM nss
 WHERE question='Q22'
   AND (subject='(H) Creative Arts and Design'
   OR subject='(8) Computer Science')
GROUP BY subject
/* 7  */
SELECT institution, ROUND(AVG(score*response/100)*100/AVG(response))
  FROM nss
 WHERE question='Q22'
   AND (institution LIKE '%Manchester%')
GROUP BY institution
/* 8  */
SELECT institution, SUM(sample), SUM(case when subject='(8) Computer Science' then sample end)
FROM nss
WHERE institution LIKE '%Manchester%'
   AND question='Q01' 
GROUP BY institution
/* Windows Functions   1   */
SELECT lastName, party, votes
  FROM ge
 WHERE constituency = 'S14000024' AND yr = 2017
ORDER BY votes DESC
/*  2 */
SELECT party, votes,
       RANK() OVER (ORDER BY votes DESC) as posn
  FROM ge
 WHERE constituency = 'S14000024' AND yr = 2017
ORDER BY party
/* 3  */
SELECT yr,party, votes,
      RANK() OVER (PARTITION BY yr ORDER BY votes DESC) as posn
  FROM ge
 WHERE constituency = 'S14000021'
ORDER BY party,yr
/* 4  */
SELECT constituency,party, votes, RANK() OVER (PARTITION BY constituency ORDER BY votes DESC ) AS posn
  FROM ge
 WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
   AND yr  = 2017
ORDER BY posn, constituency


/* 5  */

/* 6  */