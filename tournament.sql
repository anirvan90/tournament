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

/* Create win count view */
CREATE VIEW win_count AS
  SELECT id, name, COUNT(matches.winner) AS wins
  FROM players, matches
  WHERE players.id = matches.winner
  GROUP BY id
  ORDER BY wins DESC;

/* Create match count view */
CREATE VIEW matches_played AS
  SELECT id, COUNT(players.id) AS played
  FROM players, matches
  WHERE players.id = matches.winner OR players.id = matches.loser
  GROUP BY id
  ORDER BY played DESC;

/* Create standings view */
CREATE VIEW standings AS
  SELECT * FROM win_count
  JOIN matches_played
  ON win_count.id = matches_played.id
