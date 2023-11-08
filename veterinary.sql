CREATE DATABASE veterinary;

CREATE TABLE owners (
    PK SERIAL PRIMARY KEY,
    ofirstname VARCHAR(50),
    olastname VARCHAR(50),
    address VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE animals (
    animalid SERIAL PRIMARY KEY,
    name VARCHAR(50),
    species VARCHAR(50),
    breed VARCHAR(50),
    dateofbirth DATE,
    gender VARCHAR(10),
    color VARCHAR(50),
    ownerid INT,
    FOREIGN KEY (ownerid) REFERENCES owners(PK)
);

CREATE TABLE appointments (
    appointed SERIAL PRIMARY KEY,
    animalid INT,
    appointdate DATE,
    reason VARCHAR(255),
    FOREIGN KEY (animalid) REFERENCES animals(animalid)
);

CREATE TABLE doctors (
    doctorid SERIAL PRIMARY KEY,
    dfirstname VARCHAR(50),
    dlastname VARCHAR(50),
    specialty VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE invoices (
    invoiceid SERIAL PRIMARY KEY,
    appointed INT,
    totalamount NUMERIC(10, 2),
    paymentdate DATE,
    FOREIGN KEY (appointed) REFERENCES appointments(appointed)
);

CREATE TABLE medicalrecords (
    recorded SERIAL PRIMARY KEY,
    animalid INT,
    recorddate TIMESTAMP,
    doctorid INT,
    diagnosis TEXT,
    prescription TEXT,
    notes TEXT,
    FOREIGN KEY (animalid) REFERENCES animals(animalid),
    FOREIGN KEY (doctorid) REFERENCES doctors(doctorid)
);
