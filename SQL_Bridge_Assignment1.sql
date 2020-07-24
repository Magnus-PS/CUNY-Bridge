/* CUNY SPS - SQL Bridge Course - Assignment 1 */
/* Student: Magnus Skonberg */
/* Date: July 24th 2020 */

/* 1. Which destination in the flights database is the furthest distance away, based on information in the flights table. */

SELECT * FROM flights
WHERE distance = 
	(SELECT MAX(distance) AS furthest FROM flights);

/*Honolulu*/

/* 2. What are the different numbers of engines in the planes table? For each number of engines, which aircraft have
the most number of seats? */

SELECT DISTINCT engine 
FROM planes;

/* 6 types of engines */

SELECT MAX(seats) AS TF_maxSeat FROM planes
WHERE engine = 'Turbo-fan';

SELECT MAX(seats) AS TJ_maxSeat FROM planes
WHERE engine = 'Turbo-jet';

SELECT MAX(seats) AS R_maxSeat FROM planes
WHERE engine = 'Reciprocating';

SELECT MAX(seats) AS F_maxSeat FROM planes
WHERE engine = '4 Cycle';

SELECT MAX(seats) AS TS_maxSeat FROM planes
WHERE engine = 'Turbo-shaft';

SELECT MAX(seats) AS TP_maxSeat FROM planes
WHERE engine = 'Turbo-prop';

/* 3. Show the total number of flights. */

SELECT COUNT(*) FROM flights;

/* 4. Show the total number of flights per airline carrier. */

SELECT carrier, COUNT(*) 
FROM flights 
GROUP BY carrier;

/* 5. Show all of the airlines, ordered by number of flights in descending order. */

SELECT carrier, COUNT(*) 
FROM flights 
GROUP BY carrier
ORDER BY COUNT(*) DESC; /* NEW line */

/* 6. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order. */

SELECT carrier, COUNT(*) 
FROM flights 
GROUP BY carrier 
ORDER BY COUNT(*) DESC
LIMIT 5; /* NEW line */

/* 7. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of
flights in descending order. */

SELECT carrier, COUNT(*) 
FROM flights
WHERE distance >= 1000 /* NEW line */
GROUP BY carrier 
ORDER BY COUNT(*) DESC
LIMIT 5;

/* 8. Create a question that (a) uses data from the flights database, and (b) requires aggregation to answer it, and
write down both the question, and the query that answers the question. */

/* Question: Show only the top 5 airlines, by departure delay more than 100mins, ordered by number of
flights in descending order. */

SELECT carrier, COUNT(*) 
FROM flights
WHERE dep_delay > 100 /* NEW line */
GROUP BY carrier 
ORDER BY COUNT(*) DESC
LIMIT 5;
