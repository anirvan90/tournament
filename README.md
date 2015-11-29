# Tournament Results
This project consists of a Python module that uses a PostgreSQL database to keep track of players and matches in a game tournament. The tournament uses the Swiss System where each player is matched with an opponent with the same win/loss record. No players are eliminated. 

### Tech Stack 
* Python - Scripting/API Template. 
* PostgreSQL - Database
* Vagrant - Virtulization
* Virtual Box - Virtual Machine

SUGGESTED INSTALLATION: Install Vagrant and Virtual Box. Run the application from the VM command line. 
DESCRIPTION: 
tournament.sql: Defines DB schema which consists of TABLES, VIEWS and a UNIQUE INDEX. 

 - TABLES (players, matches) to store data from the user. 
 - VIEWS (player_wins, matches_played, standings) to simplify queries from the python script.
 - UNIQUE INDEX (matches_unique) to prevent rematches between to players.

tournament.py: Python module consisting of functions that use 'tournament.sql'

tournament_test.py: Unit testing script that test functions from tournament.py. 


CITATIONS:

Udacity: tournament_test.py is a modules created by Udacity. tournament.py is a module shell that was populated by Anirvan Awatramani and shell was defined by Udacity.

Udacity forums and StackOverflow forums.

