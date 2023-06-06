/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
    animal_id INT GENERATED ALWAYS AS IDENTITY,
    id INT, 
    name varchar(20), 
    date_of_birth date, 
    escape_attempts INT, 
    neutered bit, 
    weight_kg decimal, 
    PRIMARY KEY(animal_id)
    );

    ALTER TABLE animals add column species VARCHAR(20);

-- foreign key branch
 create table owners (id serial primary key, full_name varchar(30), age int);

 create table species (id serial primary key, name varchar(20));

 alter table animals drop column species;

alter table animals add column species_id int references species(id);

alter table animals add column owner_id int references owners(id);

-- Many to many relationship
create table vets (id serial primary key, name varchar(50), age int, date_of_graduation date);

CREATE TABLE specializations ( specialization_id serial PRIMARY KEY, vet_id INT REFERENCES vets (id), species_id INT REFERENCES species (id));

CREATE TABLE visits (
    visit_id serial PRIMARY KEY,
    vet_id INT REFERENCES vets (id),
    animal_id INT REFERENCES animals (id),
    visit_date date
);
