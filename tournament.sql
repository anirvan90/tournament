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
  (id SERIAL PRIMARY KEY, 
  winner INTEGER REFERENCES players(id), 
  loser INTEGER REFERENCES players(id));

/* Create win count view */
CREATE VIEW win_count AS
  SELECT players.id, players.name, COUNT(matches.winner) AS wins
  FROM players LEFT JOIN matches
  ON players.id = matches.winner
  GROUP BY players.id
  ORDER BY wins DESC

/* Create match count view */
CREATE VIEW matches_played AS
  SELECT players.id, players.name, COUNT(matches.id) AS matches_played
  FROM players
  LEFT JOIN matches
  ON players.id = matches.id
  GROUP BY players.id;

/* Create standings view */
CREATE VIEW standings AS
  SELECT players.id, players.name, 
  COALESCE ((SELECT COUNT(matches.winner) FROM players,matches
  GROUP BY players.id),0) as win_record,
  COALESCE ((SELECT COUNT(matches.winner)+COUNT(matches.loser) FROM matches
  GROUP BY players.id),0) as played
  FROM players
  LEFT JOIN matches
  ON players.id = matches.winner
  ORDER BY win_record ORDER BY DESC;
