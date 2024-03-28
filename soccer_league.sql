DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE leagues (
    id SERIAL PRIMARY KEY,
    league_name TEXT,
    start_date DATE,
    end_date DATE
)

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    team_name TEXT,
    league_id INTEGER REFERENCES leagues,
    rank_in_league UNIQUE INTEGER
);

CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    date_played DATE,
    team1_id INTEGER REFERENCES teams,
    team2_id INTEGER REFERENCES teams
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    full_name TEXT
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players,
    game_id INTEGER REFERENCES games
);

CREATE TABLE players_teams (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players,
    team_id INTEGER REFERENCES teams
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    game_id INTEGER REFERENCES games
);