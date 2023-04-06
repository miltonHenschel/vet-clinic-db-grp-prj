/* Populate database with sample data. */
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (5, 'Agumon', DATE '2020-02-03', 0, true, 10.23);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (10, 'Gabumon', DATE '2018-11-15', 2, true, 8);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (11, 'Pikachu', DATE '2021-01-07', 1, false, 15.04);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (12, 'Devimon', DATE '2017-05-12', 5, true, 11);


/* Vet clinic database: query and update animals table */
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES
 (13, 'Charmander', DATE '2020-02-08', -11, false, 0),
 (14, 'Plantomon', DATE '2021-11-15', -5.7, true, 2),
 (15, 'Squirtle', DATE '1993-04-02', -12.13, false, 3)
 (16, 'Angemon', DATE '2005-06-12', -45, true, 1)
 (17, 'Blossom', DATE '2005-06-07', 20.4, true, 7),
 (18, 'Boarmon', DATE '2005-06-07', 20.4, true, 7),
 (19, 'Ditto', DATE '2022-05-14', 22, true, 4);

/* Vet clinic database: query multiple tables */

 vet_clinic=# INSERT INTO owners (full_name, age) 
 VALUES ('Sam Smith', 34),
        ('Jennifer Orwell', 19),
        ('Bob', 45),
        ('Melody', 77),
        ('Dean Winchester', 14),
        ('Jodie Whittaker', 38);

vet_clinic=# INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');

UPDATE animals 
SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
WHERE name LIKE '%mon';

UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
WHERE species_id IS NULL;

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name IN ('Angemon', 'Boarmon');