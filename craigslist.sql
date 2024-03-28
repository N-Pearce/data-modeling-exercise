DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT,
    text TEXT,
    user INTEGER REFERENCES users,
    location TEXT,
    region INTEGER REFERENCES regions,
    category INTEGER REFERENCES categories
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    preferred_region INTEGER REFERENCES regions
);

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT
);