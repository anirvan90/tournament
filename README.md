# Tournament Results
This project consists of a Python module that uses a PostgreSQL database to keep track of players and matches in a game tournament. The tournament uses the Swiss System where each player is matched with an opponent with the same win/loss record. No players are eliminated. 

### Tech Stack 
* Python - Scripting/API Template. 
* PostgreSQL - Database
* Vagrant - Virtulization
* Virtual Box - Virtual Machine

### Installation
You must have [Vagrant](https://www.vagrantup.com/) and [Virtual Box](https://www.virtualbox.org/) as well as Python installed on your machine to run the application successfully. [Clone the fullstack-nanodegree-vm](https://github.com/udacity/fullstack-nanodegree-vm). In the vagrant directory of the clone delete the existing tournament directory and clone this [repo](https://github.com/anirvan90/tournament.git). In the command line navigate to the vagrant directory and launch the VM. 

`vagrant$ vagrant up`
`vagrant$ vagrant ssh`

In the VM navigate to the vagrant directory which is a clone of your local machines directory.

`vagrant@vagrant-ubuntu-trusty-32:~$ cd /vagrant/tournament`

All python scripts in the VM must be run with the python keyword preceding the file
`vagrant@vagrant-ubuntu-trusty-32:/vagrant/tournament$ python tournament_test.py`

### Description
**tournament.sql**: Defines DB schema which consists of TABLES, VIEWS and a UNIQUE INDEX. 

* TABLES (players, matches) to store data from the user. 
* VIEWS (player_wins, matches_played, standings) to simplify queries from the python script.
* UNIQUE INDEX (matches_unique) to prevent rematches between to players.

**tournament.py**: Python module consisting of functions that use _tournament.sql_

**tournament_test.py**: Unit testing script that test functions from _tournament.py_. 


### Citations

Udacity: tournament_test.py is a modules created by Udacity. tournament.py is a module shell that was populated by Anirvan Awatramani and shell was defined by Udacity.

Udacity forums and StackOverflow forums.

