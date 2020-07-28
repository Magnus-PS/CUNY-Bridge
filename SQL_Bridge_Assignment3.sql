/* CUNY SPS - SQL Bridge Course - Assignment 3 */
/* Student: Magnus Skonberg */
/* Date: July 28th 2020 */

/* Purpose: to design a relational database management system in mySQL. */

/* START OF ASSIGNMENT */

/*Create essential tables*/
CREATE TABLE Users(empID int, name text, groupID int);
CREATE TABLE Bus_Group(groupID int, bus_group text);
CREATE TABLE Rooms(rmID int, room text);
CREATE TABLE Bus_Rooms(groupID int, rmID int);

/*Populate Users table*/
INSERT INTO Users VALUES(1, 'Modesto', 1);
INSERT INTO Users VALUES(2, 'Ayine', 1);
INSERT INTO Users VALUES(3, 'Christopher', 2);
INSERT INTO Users VALUES(4, 'Cheong woo', 2);
INSERT INTO Users VALUES(5, 'Saulat', 3);
INSERT INTO Users VALUES(6, 'Heidy', null);

/*Populate Bus_Group table*/
INSERT INTO Bus_Group VALUES(1, 'IT');
INSERT INTO Bus_Group VALUES(2, 'Sales');
INSERT INTO Bus_Group VALUES(3, 'Administration');
INSERT INTO Bus_Group VALUES(4, 'Operations');

/*Populate Rooms table*/
INSERT INTO Rooms VALUES(1, '101');
INSERT INTO Rooms VALUES(2, '102');
INSERT INTO Rooms VALUES(3, 'Auditorium A');
INSERT INTO Rooms VALUES(4, 'Auditorium B');

/*Populate Bus_Rooms table*/
INSERT INTO Bus_Rooms VALUES(1, 1);
INSERT INTO Bus_Rooms VALUES(1, 2);
INSERT INTO Bus_Rooms VALUES(2, 2);
INSERT INTO Bus_Rooms VALUES(2, 3);

/* Write a SELECT statement that provides all groups, and the users in each group. A group should appear even if there are no users assigned to the group */
SELECT bus_group, u.name FROM Bus_Group b
LEFT JOIN Users u ON b.groupID = u.groupID;

/* Write a SELECT statement that provides all rooms, and the groups assigned to each room. The rooms should appear even if no groups have been assigned to them. */
SELECT room, b.bus_group FROM Rooms r
LEFT JOIN Bus_Rooms br ON r.rmID = br.rmID
LEFT JOIN Bus_Group b ON br.groupID = b.groupID;

/* Write a SELECT statement that provides a list of users, the groups that they belong to, and the rooms to which they are assigned. This should be sorted alphabetically by user, then by group, then by room.*/
SELECT DISTINCT u.name, b.bus_group, r.room FROM Users u
LEFT JOIN Bus_Group b ON u.groupID = b.groupID
LEFT JOIN Bus_Rooms br ON b.groupID = br.groupID
LEFT JOIN Rooms r ON br.rmID = r.rmID
GROUP BY u.name
ORDER BY u.name ASC;

/* END OF ASSIGNMENT */