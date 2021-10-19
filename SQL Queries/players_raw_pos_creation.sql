use FPL;

SELECT p.assists, p.bonus, p.bps, p.clean_sheets, p.creativity, p.goals_scored, p.ict_index, p.influence, p.minutes, p.saves, p.selected_by_percent,
p.team, p.threat, p.total_points, p.transfers_in, p.transfers_out, p.prices, c.element_type, p.first_name, p.second_name
FROM players_raw as p 
INNER JOIN cleaned_players as c ON p.first_name = c.first_name AND p.second_name = c.second_name