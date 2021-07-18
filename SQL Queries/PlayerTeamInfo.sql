USE FANTASY_PL

SELECT * FROM players_raw
SELECT * FROM teams
SELECT * FROM cleaned_players

SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

/* Find Which Teams Had Most Total Fantasy Points and What Position They Finished in */
SELECT t.name, SUM(p.total_points), t.position
FROM teams as t
INNER JOIN players_raw as p ON t.id = p.team
GROUP BY p.team
ORDER BY SUM(p.total_points) DESC

/* Find Which Teams Had Most Total Fantasy Points by Field Position and 
    What Position They Finished in the Standings */
SELECT t.name, SUM(p.total_points), t.position, c.element_type
FROM ((players_raw as p INNER JOIN teams as t ON p.team = t.id) 
INNER JOIN cleaned_players as c ON p.first_name = c.first_name
AND p.second_name = c.second_name)
GROUP BY p.team, c.element_type
ORDER BY SUM(p.total_points) DESC

/* Find Which Teams Had Most Total Fantasy Points by Forwards and 
    What Position They Finished in the Standings */
SELECT t.name, SUM(p.total_points), t.position, c.element_type
FROM ((players_raw as p INNER JOIN teams as t ON p.team = t.id) 
INNER JOIN cleaned_players as c ON p.first_name = c.first_name
AND p.second_name = c.second_name)
GROUP BY p.team, c.element_type
HAVING c.element_type = 'FWD'
ORDER BY SUM(p.total_points) DESC

/* Find Which Teams Had Most Total Fantasy Points by Midfielders and 
    What Position They Finished in the Standings */
SELECT t.name, SUM(p.total_points), t.position, c.element_type
FROM ((players_raw as p INNER JOIN teams as t ON p.team = t.id) 
INNER JOIN cleaned_players as c ON p.first_name = c.first_name
AND p.second_name = c.second_name)
GROUP BY p.team, c.element_type
HAVING c.element_type = 'MID'
ORDER BY SUM(p.total_points) DESC

/* Find Which Teams Had Most Total Fantasy Points by Defenders and 
    What Position They Finished in the Standings */
SELECT t.name, SUM(p.total_points), t.position, c.element_type
FROM ((players_raw as p INNER JOIN teams as t ON p.team = t.id) 
INNER JOIN cleaned_players as c ON p.first_name = c.first_name
AND p.second_name = c.second_name)
GROUP BY p.team, c.element_type
HAVING c.element_type = 'DEF'
ORDER BY SUM(p.total_points) DESC

/* Find Which Teams Had Most Total Fantasy Points by Field Position and 
    What Position They Finished in the Standings */
SELECT t.name, SUM(p.prices), t.position
FROM players_raw as p INNER JOIN teams as t ON p.team = t.id
WHERE NOT p.prices = 4
GROUP BY p.team
ORDER BY SUM(p.prices) DESC

/* Top 10 Fantasy Point Players with Team IDs */
SELECT p.first_name, p.second_name, p.total_points, p.team
FROM players_raw as p
ORDER BY p.total_points DESC
LIMIT 10

/* Bruno Fernandes and his Teammates */
SELECT p.first_name, p.second_name, p.total_points, c.element_type
FROM ((players_raw as p INNER JOIN teams as t ON p.team = t.id) 
INNER JOIN cleaned_players as c ON p.first_name = c. first_name 
AND p.second_name = c.second_name)
WHERE t.id = 13
ORDER BY p.total_points DESC

/* Harry Kane, Heung-Min Son and their Teammates */
SELECT p.first_name, p.second_name, p.goals_scored, p.assists, p.total_points, c.element_type
FROM ((players_raw as p INNER JOIN teams as t ON p.team = t.id) 
INNER JOIN cleaned_players as c ON p.first_name = c. first_name 
AND p.second_name = c.second_name)
WHERE t.id = 17
ORDER BY p.total_points DESC

/* Mo Salah and his Teammates */
SELECT p.first_name, p.second_name, p.goals_scored, p.assists, p.total_points, c.element_type
FROM ((players_raw as p INNER JOIN teams as t ON p.team = t.id) 
INNER JOIN cleaned_players as c ON p.first_name = c. first_name 
AND p.second_name = c.second_name)
WHERE t.id = 11
ORDER BY p.total_points DESC

/* Patrick Bamford and his Teammates */
SELECT p.first_name, p.second_name, p.goals_scored, p.assists, p.total_points, c.element_type
FROM ((players_raw as p INNER JOIN teams as t ON p.team = t.id) 
INNER JOIN cleaned_players as c ON p.first_name = c. first_name 
AND p.second_name = c.second_name)
WHERE t.id = 10
ORDER BY p.total_points DESC

/* Jamie Vardy and his Teammates */
SELECT p.first_name, p.second_name, p.goals_scored, p.assists, p.total_points, c.element_type
FROM ((players_raw as p INNER JOIN teams as t ON p.team = t.id) 
INNER JOIN cleaned_players as c ON p.first_name = c. first_name 
AND p.second_name = c.second_name)
WHERE t.id = 9
ORDER BY p.total_points DESC

/* Emiliano Martinez and his Teammates */
SELECT p.first_name, p.second_name, p.goals_scored, p.assists, p.total_points, c.element_type
FROM ((players_raw as p INNER JOIN teams as t ON p.team = t.id) 
INNER JOIN cleaned_players as c ON p.first_name = c. first_name 
AND p.second_name = c.second_name)
WHERE t.id = 2
ORDER BY p.total_points DESC

/* See which teams had the most creativity */
SELECT t.name, ROUND(SUM(p.creativity),2), t.position
FROM teams as t
INNER JOIN players_raw as p ON t.id = p.team
GROUP BY p.team
ORDER BY SUM(p.creativity) DESC

/* See which teams had the most influence */
SELECT t.name, ROUND(SUM(p.influence),2), t.position
FROM teams as t
INNER JOIN players_raw as p ON t.id = p.team
GROUP BY p.team
ORDER BY SUM(p.influence) DESC

/* See which teams had the most threat */
SELECT t.name, ROUND(SUM(p.threat),2), t.position
FROM teams as t
INNER JOIN players_raw as p ON t.id = p.team
GROUP BY p.team
ORDER BY SUM(p.threat) DESC

/* See which teams had the highest ICT */
SELECT t.name, ROUND(SUM(p.ict_index),2), t.position
FROM teams as t
INNER JOIN players_raw as p ON t.id = p.team
GROUP BY p.team
ORDER BY SUM(p.ict_index) DESC

/* Look at Aston Villa and ICT Statistics */
SELECT first_name, second_name, total_points, ict_index
FROM players_raw
WHERE team = 2
ORDER BY total_points DESC

/* Look at Aston Villa and ICT Statistics */
SELECT first_name, second_name, total_points, ict_index
FROM players_raw
WHERE team = 2
ORDER BY ict_index DESC




