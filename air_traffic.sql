-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  person_id INTEGER REFERENCES people,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER REFERENCES airlines NOT NULL,
  from_city_id INTEGER REFERENCES cities NOT NULL,
  to_city_id INTEGER REFERENCES cities NOT NULL,
);

CREATE TABLE people (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT
);

CREATE TABLE airlines (
    id SERIAL PRIMARY KEY,
    airline_name TEXT
);

CREATE TABLE countires (
    id SERIAL PRIMARY KEY,
    country_name TEXT
);

CREATE TABLE cities (
    id SERIAL PRIMARY KEY,
    city_name TEXT,
    country_id INTEGER REFERENCES countries
);

INSERT INTO people
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'), -- 5
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes') -- 7

INSERT INTO airlines
  (airline_name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'), -- 5
  ('American Airlines'),
  ('Avianca Brasil') -- 7

INSERT INTO countries
  (country_name)
VALUES
  ('United States'),
  ('Japan'),
  ('United Kingdom'),
  ('Mexico'),
  ('France'), -- 5
  ('Morocco'),
  ('UAE'),
  ('China'),
  ('Brazil'),
  ('Chile') -- 10

INSERT INTO cities
  (city_name)
VALUES
    ('Washington DC', 1),('Seattle', 1),('Tokyo', 2),('London', 3), -- 4
    ('Los Angles', 1),('Las Vegas', 1),('Mexico City', 4),('Paris', 5), -- 8
    ('Casablanca', 6),('Dubai', 7),('Beijing', 8),('New York', 1), -- 12
    ('Charlotte', 1),('Cedar Rapids', 1),('Chicago', 1),('New Orleans', 1), -- 16
    ('Sao Paolo', 9),('Santiago', 10) -- 18


INSERT INTO tickets
  (person_id, seat, departure, arrival, airline_id, from_city_id, to_city_id)
VALUES
  (1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 2),
  (2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 3, 4),
  (1, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 2, 7),
  (3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 5, 6),
  (4, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 8, 9),
  (2, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 10, 11),
  (5, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 12, 13),
  (6, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 14, 15),
  (5, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 13, 16),
  (7, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 17, 18);