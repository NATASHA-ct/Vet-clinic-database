/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL,
    PRIMARY KEY(id)
);

-- drop species column 
ALTER TABLE animals
DROP COLUMN species;

-- create owner table.
CREATE TABLE owners (
    id BIGSERIAL PRIMARY KEY ,
    full_name varchar(250),
    age INT NOT NULL,
    PRIMARY KEY(id)
);

-- species table
CREATE TABLE species (
    id BIGSERIAL PRIMARY KEY ,
    name varchar(250),
    PRIMARY KEY(id)
);


ALTER TABLE animals ADD COLUMN species_id INT;

ALTER TABLE animals ADD CONSTRAINT fk_animals_species FOREIGN KEY( species_id) REFERENCES species(id);

ALTER TABLE animals ADD COLUMN owner_id INT;

ALTER TABLE animals ADD CONSTRAINT fk_animals_owners FOREIGN KEY( owner_id) REFERENCES owners(id);


CREATE TABLE vets (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY ,
    name varchar(250),
    age INT NOT NULL,
    date_of_graduation DATE NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE specializations (
    species_id INT NOT NULL,
    vets_id INT NOT NULL,
    name varchar(250),
    PRIMARY KEY(species_id, vets_id),
    CONSTRAINT fk_specializations_species  FOREIGN KEY(species_id) REFERENCES species(id),
    CONSTRAINT fk_specializations_vets  FOREIGN KEY(vets_id) REFERENCES vets(id)
);

CREATE TABLE visits (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    animal_id INT NOT NULL,
    vet_id INT NOT NULL,
    date_of_visit DATE NOT NULL,
    CONSTRAINT fk_animals FOREIGN KEY (animal_id) REFERENCES animals(id),
    CONSTRAINT fk_vets FOREIGN KEY (vet_id) REFERENCES vets(id)
);
