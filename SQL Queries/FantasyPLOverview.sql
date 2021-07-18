USE FANTASY_PL

CREATE TABLE players_raw_2021 (
	assists INT NOT NULL,
    bonus INT NOT NULL,
    bps INT NOT NULL,
    clean_sheets INT NOT NULL,
    indirect_rank INT NOT NULL,
    creativity FLOAT NOT NULL,
    creativity_rank INT NOT NULL,
    freekick_rank INT NOT NULL,
    no_top_week_squad INT NOT NULL,
    first_name varchar(64) NOT NULL,
    goals_scored INT NOT NULL,
    ict_index FLOAT NOT NULL,
    ict_index_rank INT NOT NULL,
    player_id INT NOT NULL,
    influence FLOAT NOT NULL,
    influence_rank INT NOT NULL,
    minutes_played INT NOT NULL,
    pens_missed INT NOT NULL,
    pens_order INT NOT NULL,
    pts_per_game FLOAT NOT NULL,
    red_cards INT NOT NULL,
    saves INT NOT NULL,
    last_name varchar(64) NOT NULL,
    pct_selected FLOAT NOT NULL,
    team_id INT NOT NULL,
    team_code INT NOT NULL,
    threat INT NOT NULL,
    threat_rank INT NOT NULL,
    threat_rank_type INT NOT NULL,
    total_points INT NOT NULL,
    transfers_in INT NOT NULL,
    transfers_out INT NOT NULL,
    yellow_cards INT NOT NULL,
    prices FLOAT NOT NULL,
    PRIMARY KEY (player_id)
    
);

SELECT * FROM players_raw


