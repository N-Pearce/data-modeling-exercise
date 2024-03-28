DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE centers (
    id SERIAL PRIMARY KEY,
    center_name TEXT
);

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    full_name TEXT,
    center_id INTEGER REFERENCES centers
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    full_name TEXT,
)

CREATE TABLE doctors_patients (
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors,
    patient_id INTEGER REFERENCES patients
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    name TEXT,
    patient_id INTEGER REFERENCES patients
);