/* CUNY SPS - SQL Bridge Course - Assignment 2 */
/* Student: Magnus Skonberg */
/* Date: July 25th 2020 */

/* Purpose: to create and populate tables and combine information from two or more tables in mySQL. */

/* START OF ASSIGNMENT */

/*First a new 'videos' database / schema was created.*/

/* 1. Videos table. Create one table to keep track of the videos. This table should include a unique ID, the title of the
video, the length in minutes, and the URL. Populate the table with at least three related videos from YouTube or
other publicly available resources. */

/* CREATE TABLE videos(ID int, title text, length int, URL text); - Table Created*/

INSERT INTO videos VALUES(1, 'Darren Till asks ...', 4, 'https://www.youtube.com/watch?v=e8EeYymJFTs');
INSERT INTO videos VALUES(2, 'Flake | by Jack Johnson', 4, 'https://www.youtube.com/watch?v=oYAYE7Ods3k');
INSERT INTO videos VALUES(3, 'How Dopamine Helps ...', 5, 'https://www.youtube.com/watch?v=eJFfoSQcC0A');

/* 2. Create and populate Reviewers table. Create a second table that provides at least two user reviews for each of
at least two of the videos. These should be imaginary reviews that include columns for the user’s name
(“Asher”, “Cyd”, etc.), the rating (which could be NULL, or a number between 0 and 5), and a short text review
(“Loved it!”). There should be a column that links back to the ID column in the table of videos. */

/*CREATE TABLE reviewers(ID int, name text, rating int, review text);*/

INSERT INTO reviewers VALUES(1, 'Jamonie James', 4, 'good video');
INSERT INTO reviewers VALUES(2, 'Jamonie James', 2, 'hmmm, not impressed.');
INSERT INTO reviewers VALUES(3, 'Philip Hughes', 5, 'absolutely radical!');
INSERT INTO reviewers VALUES(1, 'Philip Hughes', 3, 'pretty OK ...');

/* 3. Report on Video Reviews. Write a JOIN statement that shows information from both tables. */

SELECT DISTINCT v.ID, title, r.rating, r.review FROM videos v
JOIN reviewers r ON v.ID = r.ID;

/* END OF ASSIGNMENT */