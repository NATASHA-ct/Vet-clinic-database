CREATE TABLE "animals"(
    "id" INTEGER NOT NULL,
    "name" CHAR(255) NOT NULL,
    "date_of_birth" DATE NOT NULL,
    "escape_attempts" INTEGER NOT NULL,
    "neutered" BOOLEAN NOT NULL,
    "weight_kg" INTEGER NOT NULL,
    "species_id" INTEGER NOT NULL,
    "owner_id" INTEGER NOT NULL
);
ALTER TABLE
    "animals" ADD PRIMARY KEY("id");
COMMENT
ON COLUMN
    "animals"."id" IS 'GENERATED ALWAYS AS IDENTITY,';
CREATE TABLE "owners"(
    "id" BIGINT NOT NULL,
    "full_name" CHAR(255) NOT NULL,
    "age" INTEGER NOT NULL,
    "email" CHAR(255) NOT NULL
);
ALTER TABLE
    "owners" ADD PRIMARY KEY("id");
CREATE INDEX "owners_email_index" ON
    "owners"("email");
CREATE TABLE "species"(
    "id" BIGINT NOT NULL,
    "name" CHAR(255) NOT NULL
);
ALTER TABLE
    "species" ADD PRIMARY KEY("id");
CREATE TABLE "vets"(
    "id" INTEGER NOT NULL,
    "name" CHAR(255) NOT NULL,
    "age" INTEGER NOT NULL,
    "date_of_graduation" DATE NOT NULL
);
ALTER TABLE
    "vets" ADD PRIMARY KEY("id");
CREATE TABLE "specializations"(
    "species_id" INTEGER NOT NULL,
    "vets_id" INTEGER NOT NULL,
    "name" CHAR(255) NOT NULL
);
ALTER TABLE
    "specializations" ADD PRIMARY KEY("species_id");
ALTER TABLE
    "specializations" ADD PRIMARY KEY("vets_id");
CREATE TABLE "visits"(
    "id" INTEGER NOT NULL,
    "animal_id" INTEGER NOT NULL,
    "vet_id" INTEGER NOT NULL,
    "date_of_visit" INTEGER NOT NULL
);
ALTER TABLE
    "visits" ADD PRIMARY KEY("id");
CREATE INDEX "visits_animal_id_index" ON
    "visits"("animal_id");
CREATE INDEX "visits_vet_id_index" ON
    "visits"("vet_id");
COMMENT
ON COLUMN
    "visits"."id" IS 'GENERATED ALWAYS AS IDENTITY';
ALTER TABLE
    "visits" ADD CONSTRAINT "visits_animal_id_foreign" FOREIGN KEY("animal_id") REFERENCES "animals"("id");
ALTER TABLE
    "animals" ADD CONSTRAINT "animals_owner_id_foreign" FOREIGN KEY("owner_id") REFERENCES "owners"("id");
ALTER TABLE
    "animals" ADD CONSTRAINT "animals_species_id_foreign" FOREIGN KEY("species_id") REFERENCES "species"("id");
ALTER TABLE
    "animals" ADD CONSTRAINT "animals_species_id_foreign" FOREIGN KEY("species_id") REFERENCES "specializations"("species_id");
ALTER TABLE
    "visits" ADD CONSTRAINT "visits_vet_id_foreign" FOREIGN KEY("vet_id") REFERENCES "vets"("id");