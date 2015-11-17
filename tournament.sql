-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.
CREATE DATABASE tournament;
\c tournament;

CREATE TABLE players (player_id SERIAL primary key, name TEXT);

CREATE TABLE matches (round_id integer, match_id integer, player1 integer,
                      player2 integer, winner integer, loser integer);
