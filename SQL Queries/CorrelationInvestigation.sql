USE FANTASY_PL

/* Top 10 Goalkeepers by BPS */
SELECT p.first_name, p.second_name, p.bps
FROM players_raw AS p
INNER JOIN cleaned_players AS c ON p.first_name = c.first_name AND
p.second_name = c.second_name
WHERE c.element_type = 'GK'
ORDER BY p.bps DESC
LIMIT 10 

/* Top 10 Goalkeepers by Minutes */
SELECT p.first_name, p.second_name, p.minutes
FROM players_raw AS p
INNER JOIN cleaned_players AS c ON p.first_name = c.first_name AND
p.second_name = c.second_name
WHERE c.element_type = 'GK'
ORDER BY p.minutes DESC
LIMIT 10

/* Top 10 Goalkeepers by Influence */
SELECT p.first_name, p.second_name, p.influence
FROM players_raw AS p
INNER JOIN cleaned_players AS c ON p.first_name = c.first_name AND
p.second_name = c.second_name
WHERE c.element_type = 'GK'
ORDER BY p.influence DESC
LIMIT 10

/* Top 10 Defenders by BPS */
SELECT p.first_name, p.second_name, p.bps
FROM players_raw AS p
INNER JOIN cleaned_players AS c ON p.first_name = c.first_name AND
p.second_name = c.second_name
WHERE c.element_type = 'DEF'
ORDER BY p.bps DESC
LIMIT 10 

/* Top 10 Defenders by influence */
SELECT p.first_name, p.second_name, p.influence
FROM players_raw AS p
INNER JOIN cleaned_players AS c ON p.first_name = c.first_name AND
p.second_name = c.second_name
WHERE c.element_type = 'DEF'
ORDER BY p.influence DESC
LIMIT 10 

/* Top 10 Defenders by minutes */
SELECT p.first_name, p.second_name, p.minutes
FROM players_raw AS p
INNER JOIN cleaned_players AS c ON p.first_name = c.first_name AND
p.second_name = c.second_name
WHERE c.element_type = 'DEF'
ORDER BY p.minutes DESC
LIMIT 10 

/* Top 10 Midfielders by influence */
SELECT p.first_name, p.second_name, p.influence
FROM players_raw AS p
INNER JOIN cleaned_players AS c ON p.first_name = c.first_name AND
p.second_name = c.second_name
WHERE c.element_type = 'MID'
ORDER BY p.influence DESC
LIMIT 10 

/* Top 10 Midfielders by ict_index */
SELECT p.first_name, p.second_name, p.ict_index
FROM players_raw AS p
INNER JOIN cleaned_players AS c ON p.first_name = c.first_name AND
p.second_name = c.second_name
WHERE c.element_type = 'MID'
ORDER BY p.ict_index DESC
LIMIT 10 

/* Top 10 Midfielders by bps */
SELECT p.first_name, p.second_name, p.bps
FROM players_raw AS p
INNER JOIN cleaned_players AS c ON p.first_name = c.first_name AND
p.second_name = c.second_name
WHERE c.element_type = 'MID'
ORDER BY p.bps DESC
LIMIT 10 

/* Top 10 Forwards by bps */
SELECT p.first_name, p.second_name, p.bps
FROM players_raw AS p
INNER JOIN cleaned_players AS c ON p.first_name = c.first_name AND
p.second_name = c.second_name
WHERE c.element_type = 'FWD'
ORDER BY p.bps DESC
LIMIT 10 

/* Top 10 Forwards by influence */
SELECT p.first_name, p.second_name, p.influence
FROM players_raw AS p
INNER JOIN cleaned_players AS c ON p.first_name = c.first_name AND
p.second_name = c.second_name
WHERE c.element_type = 'FWD'
ORDER BY p.influence DESC
LIMIT 10 

/* Top 10 Forwards by ict_index */
SELECT p.first_name, p.second_name, p.ict_index
FROM players_raw AS p
INNER JOIN cleaned_players AS c ON p.first_name = c.first_name AND
p.second_name = c.second_name
WHERE c.element_type = 'FWD'
ORDER BY p.ict_index DESC
LIMIT 10 