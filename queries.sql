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

/* PROJECT DAY 4 "JOIN Multiple TABLEs" FOR VISITS */

-- Who was the last animal seen by William Tatcher?
SELECT animals.name, visits.date_of_visit
FROM animals 
JOIN visits ON visits.animals_id = animals.id
JOIN vets ON vets.id = visits.vets_id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit DESC LIMIT 1;

SELECT animals.name, visits.date_of_visit 
FROM animals 
JOIN visits ON visits.animals_id = animals.id 
JOIN vets ON vets.id = visits.vets_id 
WHERE vets.name = 'William Tatcher' 
ORDER BY visits.date_of_visit DESC LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT COUNT(animals.name), animals.name FROM animals
JOIN visits ON visits.animals_id = animals.id
JOIN vets ON visits.vets_id = vets.id
WHERE vets.name = 'Stephanie Mendez'
GROUP BY animals.name;

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name AS specialise_on FROM vets
LEFT JOIN specializations ON vets.id = specializations.vets_id
LEFT JOIN species ON species.id = specializations.species_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name, visits.date_of_visit AS visiting_date FROM animals 
JOIN visits ON visits.animals_id = animals.id
JOIN vets ON vets.id = visits.vets_id
WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';


-- What animal has the most visits to vets?
SELECT animals.name, COUNT(visits.date_of_visit) AS visit_count
FROM animals
JOIN visits ON visits.animals_id = animals.id
GROUP BY animals.name
ORDER BY visit_count DESC LIMIT 1; 
 
 -- Who was Maisy Smith's first visit?
 SELECT animals.name, visits.date_of_visit AS visit_date
 FROM animals 
 JOIN visits ON visits.animals_id = animals.id
 JOIN vets ON vets.id = visits.vets_id
 WHERE vets.name = 'Maisy Smith' 
 ORDER BY visit_date ASC LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT animals.name, animals.date_of_birth, animals.neutered, animals.weight_kg,
vets.name, vets.age, vets.date_of_graduation, visits.date_of_visit AS recent_visit FROM animals
JOIN visits ON visits.animals_id = animals.id
JOIN vets ON vets.id = visits.vets_id
ORDER BY recent_visit DESC LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT vets.name, COUNT(visits.animals_id) FROM visits
JOIN vets ON vets.id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id
JOIN specializations ON specializations.species_id = vets.id
WHERE specializations.species_id != animals.species_id
GROUP BY vets.name;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name, COUNT(visits.animals_id) AS species_with_most_visits FROM visits
JOIN vets ON vets.id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id
JOIN species ON species.id = animals.species_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name
ORDER BY species_with_most_visits DESC LIMIT 1;
