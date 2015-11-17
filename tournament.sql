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

CREATE TABLE matches (round_id INTEGER, match_id INTEGER, 
	                  winner INTEGER, loser INTEGER);

/* Create views to simplify reusable Select statements */
CREATE VIEW win_count AS
  SELECT players.id, players.name, COUNT(matches.winner) AS wins
  FROM players LEFT JOIN matches
  ON players.id = matches.winner OR players.id = matches.loser
  GROUP BY players.id
  ORDER BY wins DESC

