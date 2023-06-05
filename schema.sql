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
