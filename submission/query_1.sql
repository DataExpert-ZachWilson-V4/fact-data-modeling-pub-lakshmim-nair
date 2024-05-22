WITH dedup_nba_game_details AS(
  SELECT 
  game_id,
  team_id,
  player_id,
  team_abbreviation,
  team_city,
  player_name,
  nickname,
  start_position,
  comment,
  min,
  fgm,
  fga,
  fg3m,
  fg3a,
  ftm,
  fta,
  oreb,
  dreb,
  reb,
  ast,
  stl,
  blk,
  to,
  pf,
  pts,
  plus_minus,
  ROW_NUMBER() OVER(PARTITION BY game_id, team_id, player_id  ORDER BY game_id) as rnk
  FROM bootcamp.nba_game_details
  )
SELECT * FROM dedup_nba_game_details
WHERE rnk=1
