-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album TEXT NOT NULL
);

CREATE TABLE artists (
    id SERIAL PRIMARY KEY,
    artist_name TEXT
);

CREATE TABLE songs_artists (
    id SERIAL PRIMARY KEY,
    song_id INTEGER REFERENCES songs,
    artist_id INTEGER REFERENCES artists
);


CREATE TABLE producers (
    id SERIAL PRIMARY KEY,
    producer_name TEXT,
    song_id INTEGER REFERENCES songs
);

INSERT INTO songs
  (title, duration_in_seconds, release_date, album)
VALUES
  ('MMMBop', 238, '04-15-1997', 'Middle of Nowhere'),
  ('Bohemian Rhapsody', 355, '10-31-1975', 'A Night at the Opera'),
  ('One Sweet Day', 282, '11-14-1995', 'Daydream'),
  ('Shallow', 216, '09-27-2018', 'A Star Is Born'),
  ('How You Remind Me', 223, '08-21-2001', 'Silver Side Up'),
  ('New York State of Mind', 276, '10-20-2009', 'The Blueprint 3'),
  ('Dark Horse', 215, '12-17-2013', 'Prism'),
  ('Moves Like Jagger', 201, '06-21-2011', 'Hands All Over'),
  ('Complicated', 244, '05-14-2002', 'Let Go'),
  ('Say My Name', 240, '11-07-1999', 'The Writing''s on the Wall');

INSERT INTO artists
  (artist_name)
VALUES
  ('Hanson'),
  ('Queen'),
  ('Mariah Cary'),
  ('Boyz II Men'),
  ('Lady Gaga'), -- 5
  ('Bradley Cooper'),
  ('Nickelback'),
  ('Jay Z'),
  ('Alicia Keys'),
  ('Katy Perry'), -- 10
  ('Juicy J'),
  ('Maroon 5'),
  ('Christina Aguilera'),
  ('Avril Lavigne'),
  ('Destiny''s Child'), -- 15

INSERT INTO songs_artists
  (song_id, artist_id)
VALUES
  (1, 1),
  (2, 2),
  (3, 3), (3, 4),
  (4, 5), (4, 6), -- 6
  (5, 7),
  (6, 8), (6, 9),
  (7, 10), (7, 11),
  (8, 12), (8, 13), -- 13
  (9, 14),
  (10, 15)

INSERT INTO producers
  (producer_name, song_id)
VALUES
  ('Dust Brothers', 1),
  ('Stephen Lironi', 1),
  ('Roy Thomas Baker', 2),
  ('Walter Afanasieff', 3),
  ('Benjamin Rice', 4), -- 5
  ('Rick Parashar', 5),
  ('Al Shux', 6),
  ('Max Martin', 7),
  ('Cirkut', 7),
  ('Shellback', 8), -- 10
  ('Benny Blanco', 8),
  ('The Matrix', 9),
  ('Darkchild', 7), -- 13