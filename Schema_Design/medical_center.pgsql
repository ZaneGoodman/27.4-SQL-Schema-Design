DROP DATABASE medical_center_db;
CREATE DATABASE medical_center_db;
\c medical_center_db;

CREATE TABLE medical_center
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(30) UNIQUE NOT NULL,
    address TEXT NOT NULL,
    phone VARCHAR(15) NOT NULL
);

CREATE TABLE doctors 
(
    doctor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE patients
(
    patient_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE diagnoses
(
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients NOT NULL,
    disease_name VARCHAR(50) NOT NULL
);

CREATE TABLE medical_centers_doctors
(
    id SERIAL PRIMARY KEY,
    medical_center_id INTEGER REFERENCES medical_center NOT NULL,
    doctor_id INTEGER REFERENCES doctors NOT NULL
);

CREATE TABLE visits 
(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors NOT NULL,
    patient_id INTEGER REFERENCES patients NOT NULL,
    visit_date DATE NOT NULL

);

INSERT INTO medical_center (name, address, phone)
VALUES
('Baptist Medical Center', '41385 hog ln, Road Island OR, 219876', 186473985),
('Sheep Center Hospital', '84326 dahlia ct, keystone MI, 754165', 156436785),
('Alabama West Hospital', '96415 dallas rd, courtside NY, 745214', 954753249),
('Central Coast Medical Center', '40654 lane ave, central plaza CA , 980345', 854103645);

INSERT INTO doctors (first_name, last_name)
VALUES
('Jeffery','Langster'),
('Brittney','Holster'),
('Patrick','Star'),
('Gage','Goldbloom');

INSERT INTO patients (first_name, last_name)
VALUES 
('Michael', 'Robinson'),
('Andrea', 'Parker'),
('Veronica', 'Cunningham'),
('Terri', 'Chavez'),
('Kenneth', 'Ramos'),
('Donna', 'Chang');

INSERT INTO diagnoses (patient_id, disease_name)
VALUES
(4, 'smallpox'),
(4, 'bubonic plague'),
(1, 'cholera'),
(5, 'syphilis'),
(5, 'influenza'),
(2, 'influenza'),
(3, 'malaria');

INSERT INTO medical_centers_doctors(medical_center_id, doctor_id)
VALUES
(1,4),
(2,3),
(3,2),
(4,1);

INSERT INTO visits (doctor_id, patient_id, visit_date)
VALUES
(1,4, '2020-11-22'),
(2,3, '2020-12-15'),
(4,6, '2020-5-5'),
(3,5, '2021-7-9'),
(2,2, '2021-1-4'),
(3,6, '2022-12-5'),
(1,6, '2022-6-16'),
(4,1, '2022-3-8'),
(3,5, '2022-8-4'),
(2,4, '2023-2-24');