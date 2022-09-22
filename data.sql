/* Populate database with sample data. */

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Agumon', '2020-02-03', 0,true, 10.23),
('Gabumon', '2018-11-15', 2,true, 8),
('Pikachu', '2021-01-07', 1,false, 15.04),
('Devimon', '2017-05-12', 5,true, 11);

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Charmander', '2020-02-08', 0, false, -11),
('Plantmon', '2021-11-15', 2, true, -5.7),
('Squirtle', '1993-04-02', 3, false, -12.13),
('Angemon', '2005-06-12', 1, true, -45),
('Boarmon', '2005-06-07', 7, true, 20.4),
('Blossom', '1998-10-13', 3, true, 17),
('Ditto', '2022-05-14', 4, true, 22);

-- inserting data into owners table
INSERT INTO owners(full_name, age) VALUES('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45), ('Melody Pond', 77),('Dean Winchester', 14),('Jodie Whittake', 38);

-- inserting into species table
INSERT INTO species(name) VALUES('Pokemon'),('Digimon');

-- Modify inserted animals so it includes the species_id value
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;


-- Modify inserted animals to include owner information (owner_id):
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';

/* PROJECT DAY 4 - ADD "JOIN TABLE" FOR VISITS */
-- Inserting datas to vets:
INSERT INTO vets(name, age, date_of_graduation) VALUES('William Tatcher', 45, '2000-04-23');
('Maisy Smith', 26, '2019-01-17'), ('Stephanie Mendez', 64, '1981-05-04'), ('Jack Harkness', 38, '2008-06-08');

-- Inserting datas to specialties

-- William Tatcher is specialized in Pokemon
 INSERT INTO specializations(vets_id, species_id)VALUES(1,1),
(3,2),(3,1);

 -- Jack Harkness is specialized in Digimon.
 INSERT INTO specializations(vets_id, species_id)VALUES(4,2);


INSERT INTO visits (animals_id, vets_id, date_of_visit)VALUES(1,1, '2020-05-24');
INSERT INTO visits (animals_id, vets_id, date_of_visit)VALUES(1,3, '2020-07-23');
INSERT INTO visits (animals_id, vets_id, date_of_visit)VALUES(2,4, '2021-02-02');
INSERT INTO visits (animals_id, vets_id, date_of_visit)VALUES(3,2, '2020-01-05');
INSERT INTO visits (animals_id, vets_id, date_of_visit)VALUES(3,2, '2020-03-08');
INSERT INTO visits (animals_id, vets_id, date_of_visit)VALUES(3,2, '2020-05-14');
INSERT INTO visits (animals_id, vets_id, date_of_visit)VALUES(4,3, '2021-05-04');
INSERT INTO visits (animals_id, vets_id, date_of_visit)VALUES(5,4, '2021-02-24');
INSERT INTO visits (animals_id, vets_id, date_of_visit)VALUES(6,2, '2019-12-21');
INSERT INTO visits (animals_id, vets_id, date_of_visit)VALUES(6,1, '2020-08-10');
INSERT INTO visits (animals_id, vets_id, date_of_visit)VALUES(6,2, '2021-04-07');
INSERT INTO visits (animals_id, vets_id, date_of_visit)VALUES(7,3, '2019-09-21');
INSERT INTO visits (animals_id, vets_id, date_of_visit)VALUES(8,4, '2020-10-03');
INSERT INTO visits (animals_id, vets_id, date_of_visit)VALUES(8,4, '2020-11-04');
INSERT INTO visits (animals_id, vets_id, date_of_visit)VALUES(9,2, '2019-01-24');
INSERT INTO visits (animals_id, vets_id, date_of_visit)VALUES(9,2, '2019-05-15');
INSERT INTO visits (animals_id, vets_id, date_of_visit)VALUES(9,2, '2020-02-27');
INSERT INTO visits (animals_id, vets_id, date_of_visit)VALUES(9,2, '2019-08-03');
INSERT INTO visits (animals_id, vets_id, date_of_visit)VALUES(10,3, '2020-05-24');
INSERT INTO visits (animals_id, vets_id, date_of_visit)VALUES(10,1, '2021-01-11');


/* Agumon visited William Tatcher on May 24th, 2020.
Agumon visited Stephanie Mendez on Jul 22th, 2020.
Gabumon visited Jack Harkness on Feb 2nd, 2021.
Pikachu visited Maisy Smith on Jan 5th, 2020.
Pikachu visited Maisy Smith on Mar 8th, 2020.
Pikachu visited Maisy Smith on May 14th, 2020.
Devimon visited Stephanie Mendez on May 4th, 2021.
Charmander visited Jack Harkness on Feb 24th, 2021.
Plantmon visited Maisy Smith on Dec 21st, 2019.
Plantmon visited William Tatcher on Aug 10th, 2020.
Plantmon visited Maisy Smith on Apr 7th, 2021.
Squirtle visited Stephanie Mendez on Sep 29th, 2019.
Angemon visited Jack Harkness on Oct 3rd, 2020.
Angemon visited Jack Harkness on Nov 4th, 2020.
Boarmon visited Maisy Smith on Jan 24th, 2019.
Boarmon visited Maisy Smith on May 15th, 2019.
Boarmon visited Maisy Smith on Feb 27th, 2020.
Boarmon visited Maisy Smith on Aug 3rd, 2020.
Blossom visited Stephanie Mendez on May 24th, 2020. 
Blossom visited William Tatcher on Jan 11th, 2021.
*/
