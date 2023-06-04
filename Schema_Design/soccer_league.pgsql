DROP DATABASE soccer_league_db;
CREATE DATABASE soccer_league_db;
\c soccer_league_db;




CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    ref_name TEXT NOT NULL
);

CREATE TABLE leagues
(
    id SERIAL PRIMARY KEY,
    league_name TEXT NOT NULL,
    season_start_date DATE NOT NULL,
    season_end_date DATE NOT NULL
);

CREATE TABLE teams 
(
    id SERIAL PRIMARY KEY,
    team_name TEXT NOT NULL,
    leagues_id INTEGER REFERENCES leagues

);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    player_name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams
);

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    team1_id INTEGER REFERENCES teams,
    team2_id INTEGER REFERENCES teams,
    ref_id INTEGER REFERENCES referees
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players,
    team_id INTEGER REFERENCES teams,
    match_id INTEGER REFERENCES matches
);


INSERT INTO referees (ref_name)
VALUES
('Adan Roberson'),
('Roberto Santiago'),
('Antone Sandoval'),
('Domingo Rowe'),
('Zachery Conrad'),
('Sergio Bass'),
('Keith Hoover'),
('Bradly Houston'),
('Long Vance'),
('Franklyn Singh');


INSERT INTO leagues (league_name, season_start_date, season_end_date)
VALUES
('MLS', '2020-11-22', '2021-5-15'),
('UEFA Champions', '2020-6-5', '2020-12-22'),
('UEFA Europa Conference', '2021-1-18', '2021-6-1'),
('English Carabao Cup', '2022-8-22', '2023-2-28');


INSERT INTO teams (team_name, leagues_id)
VALUES
('Atlanta United FC', 1),
('Austin FC', 1),
('CF Montréal', 1),
('Charlotte FC', 1),
('AC Milan', 2),
('Ajax Amsterdam', 2),
('Atletico Madrid', 2),
('Barcelona', 2),
('AEK Larnaca', 3),
('AZ Alkmaar', 3),
('Anderlecht', 3),
('Apollon Limassol', 3),
('AFC Bournemouth', 4),
('AFC Wimbledon', 4),
('Accrington Stanley', 4),
('Arsenal', 4);


INSERT INTO players (player_name, team_id)
VALUES
('Mervin Ortiz', 1),
('Kent Cordova', 1),
('Nickolas Cervantes', 1),
('Dion Jenkins', 2),
('Charles Lucero', 2),
('Sang Chen', 2),
('Byron Morse', 3),
('Dannie Carrillo', 3),
('Wallace Haynes', 3),
('Marty Clayton', 4),
('Tod Ingram', 4),
('Ellsworth Schwartz', 4),
('Malcolm Grant', 5),
('Douglass Martinez', 5),
('Marlin Fernandez', 5),
('Frankie Beltran', 6),
('Herb Frey', 6 ),
('Lamont Mcneil', 6),
('Adam Lawson', 7),
('Hoyt Esparza', 7 ),
('Dominick Wilcox', 7),
('Evan Petersen', 8),
('Cecil Winters', 8),
('Loyd Escobar', 8),
('Ray Robles', 15),
('Boyd Harrington', 9 ),
('Monte Price', 9),
('Norman Foley',10),
('Austin Diaz',10),
('Todd Meyer',11),
('Troy Potter',11),
('Dominique Anthony',12),
('Armando Novak',12),
('Garland Porter',13),
('Kelley Barrera',13),
('Burt Bright',14),
('Modesto Bullock',14),
('Damion Hancock',15),
('Dewayne Evans',16),
('Milton Jarvis',16);



INSERT INTO  matches (team1_id, team2_id, ref_id)
VALUES
(1,15,5),
(2,3,4),
(16,8,3),
(8,9,10),
(7,12,4),
(14,13,4),
(15,14,3),
(10,11,7),
(14,8,4),
(16,15,3),
(6,7,8);




INSERT INTO goals (player_id, team_id, match_id)
VALUES
(1,1,1),
(2,1,1),
(38, 15, 1),
(22,8,4),
(22,8,4),
(22,8,4),
(37,14,7),
(37,14,7),
(36,14,7),
(7,3,2),
(7,3,2),
(8,3,2),
(8,3,2),
(9,3,2);


