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


