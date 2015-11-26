-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

/* Create DB and establish schema, drop first to ensure clean file */
DROP DATABASE tournament;
CREATE DATABASE tournament;
\c tournament;

CREATE TABLE players (id SERIAL PRIMARY KEY, name TEXT);

CREATE TABLE matches 
  (match_id SERIAL PRIMARY KEY, 
  winner INTEGER REFERENCES players(id), 
  loser INTEGER REFERENCES players(id));

/* Create match count view */
CREATE VIEW matches_played AS
  SELECT id, name, COUNT(matches.match_id) AS played
  FROM players
  LEFT JOIN matches
  ON players.id = matches.winner OR players.id = matches.loser
  GROUP BY players.id;

/* Create win count view */
CREATE VIEW player_wins AS
  SELECT id, name, COUNT (matches.winner) AS wins
  FROM players
  LEFT JOIN matches
  ON players.id = matches.winner
  GROUP BY id
  ORDER BY wins DESC;

/* Create standings view */
CREATE VIEW standings AS
  SELECT matches_played.id, matches_played.name,
  COALESCE (player_wins.wins,0) AS wins,
  COALESCE (matches_played.played,0) AS played
  FROM matches_played
  LEFT JOIN player_wins
  ON matches_played.id = player_wins.id
  ORDER BY wins DESC;
