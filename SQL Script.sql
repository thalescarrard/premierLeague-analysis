/*This is a brief analysis of team and player performance over a season of the English Premier League Division.*/

/*TEAM STATS*/
/*General Team Stats*/
SELECT league_position AS "Pos", teams1.team_name AS "Team", matches_played AS "MP", wins AS "W", draws AS "D", losses AS "L", goals_scored AS "GF", goals_conceded AS "GA", goal_difference AS "GD", (wins *3 + draws) AS "Pts", (round((wins / matches_played)*100,2)) AS "Win Percentage", FORMAT(average_attendance_home,0) AS "Attendance (home)" FROM teams1
LEFT JOIN teams2 ON teams1.team_name = teams2.team_name
ORDER BY league_position ASC;

/*General Team Stats at Home*/
SELECT league_position AS " Pos (Overall) ", league_position_home AS "Pos", teams1.team_name AS "Team", matches_played_home AS "MP", wins_home AS "W", draws_home AS "D", losses_home AS "L", goals_scored_home AS "GF", goals_conceded_home AS "GA", goal_difference_home AS "GD", (wins_home *3 + draws_home) AS "Pts", (round((wins_home / matches_played_home)*100,2)) AS "Win Percentage" FROM teams1
ORDER BY league_position_home ASC;

/*General Team Stats Away*/
SELECT league_position AS " Pos (Overall) ", league_position_away AS "Pos", teams1.team_name AS "Team", matches_played_away AS "MP", wins_away AS "W", draws_away AS "D", losses_away AS "L", goals_scored_away AS "GF", goals_conceded_away AS "GA", goal_difference_away AS "GD", (wins_away *3 + draws_away) AS "Pts", (round((wins_away / matches_played_away)*100,2)) AS "Win Percentage" FROM teams1
ORDER BY league_position_away ASC;

/*Detailed Stats*/
SELECT league_position AS "Pos", teams1.team_name AS "Team", average_possession AS "Avg Possession", matches_played as "MP", goals_scored as "GF", goals_conceded AS "GA", goal_difference AS "GD", goals_scored_per_match AS "Goals Scored per Match", goals_conceded_per_match AS "Goals Conceded per Match", clean_sheets AS "Clean Sheets", shots AS "Shots", shots_on_target AS "Shots on Target", format((shots_on_target/shots*100),2) AS "Shooting Accuracy", teams2.shots_per_match_overall AS "Avg Shots per Match" FROM teams1
LEFT JOIN teams2 ON teams1.team_name = teams2.team_name
ORDER BY league_position ASC;

/*Detailed Stats at Home*/
SELECT league_position AS "Pos (Overall)", teams1.team_name AS "Team", average_possession_home AS "Avg Possession", matches_played_home as "MP", goals_scored_home as "GF", goals_conceded_home AS "GA", goal_difference_home AS "GD", goals_scored_per_match_home AS "Goals Scored per Match", goals_conceded_per_match_home AS "Goals Conceded per Match", clean_sheets_home AS "Clean Sheets", shots_home AS "Shots", shots_on_target_home AS "Shots on Target", format((shots_on_target_home/shots_home*100),2) AS "Shooting Accuracy", teams2.shots_per_match_home AS "Avg Shots per Match" FROM teams1
LEFT JOIN teams2 ON teams1.team_name = teams2.team_name
ORDER BY league_position ASC;

/*Detailed Stats Away*/
SELECT league_position AS "Pos (Overall)", teams1.team_name AS "Team", average_possession_away AS "Avg Possession", matches_played_away as "MP", goals_scored_away as "GF", goals_conceded_away AS "GA", goal_difference_away AS "GD", goals_scored_per_match_away AS "Goals Scored per Match", goals_conceded_per_match_away AS "Goals Conceded per Match", clean_sheets_away AS "Clean Sheets", shots_away AS "Shots", shots_on_target_away AS "Shots on Target", format((shots_on_target_away/shots_away*100),2) AS "Shooting Accuracy", teams2.shots_per_match_away AS "Avg Shots per Match" FROM teams1
LEFT JOIN teams2 ON teams1.team_name = teams2.team_name
ORDER BY league_position ASC;

/*PLAYER STATS*/
/*General Player Stats*/
SELECT full_name as "Name", `Current Club` AS "Team", appearances_overall AS "Appearances", goals_overall AS "Goals", assists_overall as "Assists", (goals_overall + assists_overall) AS "G+A", format((goals_overall/appearances_overall),2) AS "Goals/Game", format((assists_overall/appearances_overall),2) AS "Assists/Game", format(((goals_overall+assists_overall)/appearances_overall),2) AS "G+A/Game", yellow_cards_overall AS "Yellow Cards", red_cards_overall AS "Red Cards" FROM players
WHERE appearances_overall > 5
ORDER BY Goals DESC;