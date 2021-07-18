USE FANTASY_PL

SELECT * FROM players_raw
SELECT * FROM teams
SELECT * FROM player_idlist
SELECT * FROM cleaned_players

/* See which players scored more than 10 goals */
SELECT first_name, second_name, goals_scored
FROM players_raw
WHERE goals_scored > 10
ORDER BY goals_scored DESC

/* See which players assisted more than 10 goals */
SELECT first_name, second_name, assists
FROM players_raw
WHERE assists > 10
ORDER BY assists DESC

/* See which players contributed to more than 20 goals */
SELECT first_name, second_name, (goals_scored + assists) AS total_contributions
FROM players_raw
WHERE (goals_scored + assists) > 20
ORDER BY (goals_scored + assists) DESC

/* See which players had more than 100 saves */
SELECT p.first_name, p.second_name, t.name, p.saves
FROM players_raw as p
INNER JOIN teams as t ON p.team  = t.id
WHERE p.saves > 100
ORDER BY p.saves DESC

/* See which goalkeepers had more than 10 clean sheets */
SELECT p.first_name, p.second_name, t.name, p.clean_sheets
FROM ((players_raw as p
	INNER JOIN teams as t ON p.team  = t.id) 
	INNER JOIN cleaned_players as c ON p.second_name = c.second_name)
WHERE c.element_type = 'GK' AND p.clean_sheets > 10
ORDER BY p.clean_sheets DESC

/* See which defenders had more than 10 clean sheets */
SELECT p.first_name, p.second_name, t.name, p.clean_sheets
FROM ((players_raw as p
	INNER JOIN teams as t ON p.team  = t.id) 
	INNER JOIN cleaned_players as c ON p.second_name = c.second_name)
WHERE c.element_type = 'DEF' AND p.clean_sheets > 10
ORDER BY p.clean_sheets DESC

/* See which players had at least 1 red card */
SELECT p.first_name, p.second_name, t.name, p.red_cards
FROM players_raw as p
INNER JOIN teams as t ON p.team  = t.id
WHERE p.red_cards > 0
ORDER BY p.red_cards DESC

/* See which players are ranked most creative */
SELECT p.first_name, p.second_name, t.name, p.creativity_rank, p.creativity
FROM players_raw as p
INNER JOIN teams as t ON p.team  = t.id
ORDER BY p.creativity_rank
LIMIT 10

/* See which players have more than one dreamteam appearances */
SELECT p.first_name, p.second_name, t.name, p.dreamteam_count
FROM players_raw as p
INNER JOIN teams as t ON p.team  = t.id
WHERE p.dreamteam_count > 1
ORDER BY p.dreamteam_count DESC

/* See which players scored the most fantasy points */
SELECT p.first_name, p.second_name, t.name, p.total_points
FROM players_raw as p
INNER JOIN teams as t ON p.team  = t.id
ORDER BY p.total_points DESC
LIMIT 10 

/* See which forwards scored the most fantasy points */
SELECT p.first_name, p.second_name, t.name, p.total_points
FROM ((players_raw as p
	INNER JOIN teams as t ON p.team  = t.id) 
	INNER JOIN cleaned_players as c ON p.second_name = c.second_name)
WHERE c.element_type = 'FWD' 
ORDER BY p.total_points DESC
LIMIT 10

/* See which midfielders scored the most fantasy points */
SELECT p.first_name, p.second_name, t.name, p.total_points
FROM ((players_raw as p
	INNER JOIN teams as t ON p.team  = t.id) 
	INNER JOIN cleaned_players as c ON p.second_name = c.second_name)
WHERE c.element_type = 'MID' 
ORDER BY p.total_points DESC
LIMIT 10

/* See which defenders scored the most fantasy points */
SELECT p.first_name, p.second_name, t.name, p.total_points
FROM ((players_raw as p
	INNER JOIN teams as t ON p.team  = t.id) 
	INNER JOIN cleaned_players as c ON p.second_name = c.second_name)
WHERE c.element_type = 'DEF' 
ORDER BY p.total_points DESC

/* See which defenders scored the most fantasy points */
SELECT p.first_name, p.second_name, t.name, p.total_points
FROM ((players_raw as p
	INNER JOIN teams as t ON p.team  = t.id) 
	INNER JOIN cleaned_players as c ON p.second_name = c.second_name)
WHERE c.element_type = 'GK' 
ORDER BY p.total_points DESC
LIMIT 10

/* Select the overall budget players */
SELECT p.first_name, p.second_name, t.name, ROUND(p.total_points/p.prices,2) AS ppp
FROM players_raw as p
INNER JOIN teams as t ON p.team  = t.id
ORDER BY ppp DESC
LIMIT 10 

/* Select the forward budget players */
SELECT p.first_name, p.second_name, t.name, ROUND(p.total_points/p.prices,2) AS ppp
FROM ((players_raw as p
	INNER JOIN teams as t ON p.team  = t.id) 
	INNER JOIN cleaned_players as c ON p.second_name = c.second_name)
WHERE c.element_type = 'FWD' 
ORDER BY ppp DESC
LIMIT 10

/* Select the midfielder budget players */
SELECT p.first_name, p.second_name, t.name, ROUND(p.total_points/p.prices,2) AS ppp
FROM ((players_raw as p
	INNER JOIN teams as t ON p.team  = t.id) 
	INNER JOIN cleaned_players as c ON p.second_name = c.second_name)
WHERE c.element_type = 'MID' 
ORDER BY ppp DESC
LIMIT 15

/* Select the defender budget players */
SELECT p.first_name, p.second_name, t.name, ROUND(p.total_points/p.prices,2) AS ppp
FROM ((players_raw as p
	INNER JOIN teams as t ON p.team  = t.id) 
	INNER JOIN cleaned_players as c ON p.second_name = c.second_name)
WHERE c.element_type = 'DEF' 
ORDER BY ppp DESC
LIMIT 15

/* Select the goalkeeper budget players */
SELECT p.first_name, p.second_name, t.name, ROUND(p.total_points/p.prices,2) AS ppp
FROM ((players_raw as p
	INNER JOIN teams as t ON p.team  = t.id) 
	INNER JOIN cleaned_players as c ON p.second_name = c.second_name)
WHERE c.element_type = 'GK' 
ORDER BY ppp DESC
LIMIT 10

/* See which players scored the most bonus points */
SELECT p.first_name, p.second_name, t.name, p.bonus
FROM players_raw as p
INNER JOIN teams as t ON p.team  = t.id
ORDER BY p.bonus DESC
LIMIT 10 

/* See which players had the highest ict_index */
SELECT p.first_name, p.second_name, t.name, p.ict_index
FROM players_raw as p
INNER JOIN teams as t ON p.team  = t.id
ORDER BY p.ict_index DESC
LIMIT 10 

/* See which players had the highest influence */
SELECT p.first_name, p.second_name, t.name, p.influence
FROM players_raw as p
INNER JOIN teams as t ON p.team  = t.id
ORDER BY p.influence DESC
LIMIT 10 

/* See which players had the highest threat */
SELECT p.first_name, p.second_name, t.name, p.threat
FROM players_raw as p
INNER JOIN teams as t ON p.team  = t.id
ORDER BY p.threat DESC
LIMIT 10 

/* See which players played the most minutes */
SELECT p.first_name, p.second_name, t.name, p.minutes
FROM players_raw as p
INNER JOIN teams as t ON p.team  = t.id
ORDER BY p.minutes DESC
LIMIT 10 

/* Select the players that had the most points per game */
SELECT p.first_name, p.second_name, t.name, p.points_per_game
FROM ((players_raw as p
	INNER JOIN teams as t ON p.team  = t.id) 
	INNER JOIN cleaned_players as c ON p.second_name = c.second_name)
WHERE p.minutes > 1000
ORDER BY p.points_per_game DESC
LIMIT 10

/* Select the forwards that had the most points per game */
SELECT p.first_name, p.second_name, t.name, p.points_per_game
FROM ((players_raw as p
	INNER JOIN teams as t ON p.team  = t.id) 
	INNER JOIN cleaned_players as c ON p.second_name = c.second_name)
WHERE p.minutes > 1000 AND c.element_type = 'FWD'
ORDER BY p.points_per_game DESC
LIMIT 10

/* Select the midfielders that had the most points per game */
SELECT p.first_name, p.second_name, t.name, p.points_per_game
FROM ((players_raw as p
	INNER JOIN teams as t ON p.team  = t.id) 
	INNER JOIN cleaned_players as c ON p.second_name = c.second_name)
WHERE p.minutes > 1000 AND c.element_type = 'MID'
ORDER BY p.points_per_game DESC
LIMIT 10

/* Select the defenders that had the most points per game */
SELECT p.first_name, p.second_name, t.name, p.points_per_game
FROM ((players_raw as p
	INNER JOIN teams as t ON p.team  = t.id) 
	INNER JOIN cleaned_players as c ON p.second_name = c.second_name)
WHERE p.minutes > 1000 AND c.element_type = 'DEF'
ORDER BY p.points_per_game DESC
LIMIT 15

/* See which players were selected to teams the most */
SELECT p.first_name, p.second_name, t.name, p.selected_by_percent
FROM players_raw as p
INNER JOIN teams as t ON p.team  = t.id
ORDER BY p.selected_by_percent DESC
LIMIT 10 









