/* Create DB and establish schema, drop first to ensure clean file.*/
DROP DATABASE tournament;
CREATE DATABASE tournament;
\c tournament;

/* Create table to store player info */
CREATE TABLE players (id SERIAL PRIMARY KEY, name TEXT);

/*Create table to store match info */
CREATE TABLE matches 
  (match_id SERIAL PRIMARY KEY, 
  winner INTEGER REFERENCES players(id), 
  loser INTEGER REFERENCES players(id));

/* Create view to display the matches each player has played*/
CREATE VIEW matches_played AS
  SELECT id, name, COUNT(matches.match_id) AS played
  FROM players
  LEFT JOIN matches
  ON players.id = matches.winner OR players.id = matches.loser
  GROUP BY players.id;

/* Create view to display each players wins */
CREATE VIEW player_wins AS
  SELECT id, name, COUNT (matches.winner) AS wins
  FROM players
  LEFT JOIN matches
  ON players.id = matches.winner
  GROUP BY id
  ORDER BY wins DESC;

/* Create view to display player standings */
CREATE VIEW standings AS
  SELECT matches_played.id, matches_played.name,
  COALESCE (player_wins.wins,0) AS wins,
  COALESCE (matches_played.played,0) AS played
  FROM matches_played
  LEFT JOIN player_wins
  ON matches_played.id = player_wins.id
  ORDER BY wins DESC;
