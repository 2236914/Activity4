CREATE DATABASE veterinary;

CREATE TABLE owners (
    ownerid SERIAL PRIMARY KEY,
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
    appointeid SERIAL PRIMARY KEY,
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
    recordid SERIAL PRIMARY KEY,
    animalid INT,
    recorddate TIMESTAMP,
    doctorid INT,
    diagnosis TEXT,
    prescription TEXT,
    notes TEXT,
    FOREIGN KEY (animalid) REFERENCES animals(animalid),
    FOREIGN KEY (doctorid) REFERENCES doctors(doctorid)
);

INSERT INTO owners (ownerid, ofirstname, olastname, address, phone, email)
VALUES
    (1, 'Juan', 'Dela Cruz', '123 Main St, Manila', '123-456-7890', 'juan@example.com'),
    (2, 'Maria', 'Santos', '456 Eim St, Quezon City', '987-654-3210', 'maria@example.com'),
    (3, 'Antonio', 'Gonzales', '789 Oak St, Cebu', '555-123-45678', 'antonio@example.com'),
    (4, 'Elena', 'Rodriguez', '345 Pine St, Davao', '777-888-9999', 'elena@example.com'),
    (5, 'Ricardo', 'Lim', '987 Cedar St, Makati', '222-333-4444', 'ricardo@example.com'),
    (6, 'Isabela', 'Reyes', '111 Acacia St, Pasig', '999-000-1111', 'isabel@example.com'),
    (7, 'Luis', 'Torres', '555 Maple St, Mandaluyong', '123-555-7777', 'luis@example.com'),
    (8, 'Carmen', 'Fernandez', '222 Birch St, Taguig', '333-222-1111', 'carmen@example.com'),
    (9, 'Pedro', 'Santillian', '888, Spruce St, Bacolod', '888-777-3333', 'pedro@example.com'),
    (10, 'Sofia', 'Villianueva', '777 Walnut St, Iloilo', '111-999-3333', 'sofia@example.com');

INSERT INTO animals(animalid, name, species, breed, dateofbirth, gender, color, ownerid)
VALUES
('1', 'Fido', 'Dog', 'Golden Retriever', '2018-03-15', 'Male', 'Golden', '1'),
('2', 'Whiskers', 'Cat', 'Siamese', '2019-07-20', 'Female', 'Cream', '2'),
('3', 'Rocky', 'Dog', 'German Shepherd', '2017-05-10', 'Male', 'Black and Tan', '3'),
('4', 'Fluffy', 'Cat', 'Persian', '2020-01-30', 'Male', 'White', '4'),
('5', 'Luna', 'Dog', 'Labrador Retriever', '2019-11-25', 'Female', 'Yellow', '5'),
('6', 'Mochi', 'Cat', 'Maine Coon', '2018-09-12', 'Male', 'Brown Tabby', '6'),
('7', 'Bella', 'Dog', 'Poodle', '2020-04-05', 'Female', 'White', '7'),
('8', 'Simba', 'Cat', 'Bengal', '2018-06-18', 'Male', 'Spotted Rosetted', '8'),
('9', 'Max', 'Dog', 'Dachshund', '2020-07-14', 'Male', 'Black and Tan', '9'),
('10','Cleo', 'Cat', 'Ragdoll', '2019-12-22', 'Female', 'Seal Point', '10');

INSERT INTO appointments(appointid, animalid, appointdate, reason)
VALUES
('1', '1', '2023-01-05', 'Annual check-up'),
('2', '2', '2023-01-10', 'Vaccination'),
('3', '3', '2023-02-02', 'Injury assessment'),
('4', '4', '2023-02-15', 'Dental cleaning'),
('5', '5', '2023-03-05', 'Skin condition'),
('6', '6', '2023-03-10', 'Check for fleas'),
('7', '7', '2023-04-12', 'Vaccination'),
('8', '8', '2023-04-18', 'Spaying/neutering'),
('9', '9', '2023-05-02', 'Allergy treatment'),
('10','10', '2023-05-20', 'Eye infection');

INSERT INTO doctors(doctorid, dfirstname, dlastname, specialty, phone, email)
VALUES
('1', 'Dr.Maria', 'Santos', 'General Veterinarian', '987-654-3210', 'maria@example.com'),
('2', 'Dr.Antonio', 'Gonzales', 'Feline Specialist', '555-123-4567', 'antonio@example.com'),
('3', 'Dr.Felipe', 'Luna', 'Orthopedic Specialist', '111-222-3333', 'felipe@example.com'),
('4', 'Dr.Sofia', 'Reyes', 'Dermatology Specialist', '999-888-7777', 'sofia@example.com'),
('5', 'Dr.Luis', 'Torres', 'Surgery Specialist', '123-555-7777', 'luis@example.com'),
('6', 'Dr.Carmen', 'Fernandez', 'Ophthalmology Specialist', '333-222-1111', 'carmen@example.com');

INSERT INTO invoices(invoiceid, appointid, totalamount, paymentdate)
VALUES
('1', '1', '50.00', '09:30:00'),
('2', '2', '75.00', '14:15:00'),
('3', '3', '100.00', '11:00:00'),
('4', '4', '200.00', '13:45:00'),
('5', '5', '80.00', '10:30:00'),
('6', '6', '30.00', '15:00:00'),
('7', '7', '75.00', '09:15:00'),
('8', '8', '150.00', '16:30:00'),
('9', '9', '60.00', '14:45:00'),
('10', '10', '40.00', '11:30:00');

 ALTER TABLE owners ADD COLUMN registereddate DATE;
   ALTER TABLE invoices
    RENAME COLUMN paymentdate TO paymenttime;
    DELETE FROM appointments
WHERE animalid = 8;