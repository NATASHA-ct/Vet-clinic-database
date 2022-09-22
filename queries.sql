/*Queries that provide answers to the questions from all projects.*/

SELECT name from animals WHERE name LIKE '%mon';

SELECT name,date_of_birth FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name, neutered, escape_attempts FROM animals WHERE neutered = true AND escape_attempts < 3; 

SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = true;

SELECT * FROM animals WHERE name != 'Gabumon';

SELECT * FROM animals WHERE weight_kg >= 10.43 AND weight_kg <= 17.3;


/*updating animals table*/
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;

SELECT * FROM animals;
BEGIN;
UPDATE animals SET species  = 'digimon' WHERE name LIKE '%mon';
 
SELECT * FROM animals;


UPDATE animals SET species  = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;
--  Inside a transaction delete all records in the animals table, then roll back the transaction.
BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK; 

-- After the rollback verify if all records in the animals table still exists.

SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';

-- Create a savepoint for the transaction.

SAVEPOINT savePointA;

-- Update all animals' weight to be their weight multiplied by -1
 UPDATE animals SET weight_kg = weight_kg * -1;
SELECT * FROM animals;
 -- Rollback to the savepoint
ROLLBACK To savePointA;

--update all animals weight that are negative to be their weight multiply by -1
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
SELECT * FROM animals;
COMMIT;


-- COUNTING ANIMALS PRESENTS
SELECT COUNT(*)FROM animals;

-- number of animals without escape attemps
SELECT COUNT(*)FROM animals WHERE escape_attempts = 0;

--average weight of animals
SELECT AVG(weight_kg) FROM animals;
-- animals with highest escape attemps for neutered or not neutered
SELECT MAX(escape_attempts) FROM animals WHERE neutered = true OR false;

-- min and max weight of animals
SELECT MIN(weight_kg), MAX(weight_kg) FROM animals;

-- 3rd day query using join 
SELECT name FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';

SELECT animals.name FROM animals INNER JOIN species ON animals.species_id= species.id WHERE species.name = 'Pokemon';

SELECT owners.full_name, name FROM owners LEFT JOIN animals ON animals.owner_id = owners.id;
SELECT species.name, COUNT(animals.name) FROM animals INNER JOIN species ON animals.species_id = species_id GROUP BY species.name;

SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Jennifer Orwell'; 

SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0; 

SELECT owners.full_name, COUNT(animals.name) FROM owners LEFT JOIN animals ON owners.id = animals.owner_id GROUP BY owners.full_name ORDER BY COUNT(animals.name) DESC;

