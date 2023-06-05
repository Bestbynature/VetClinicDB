/*Queries that provide answers to the questions FROM all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name FROM animals WHERE neutered = '1' AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = '1';

SELECT * FROM animals WHERE name <> 'Gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


UPDATE animals SET species='digimon' WHERE name LIKE '%mon';

UPDATE animals SET species='pokemon' WHERE name NOT LIKE '%mon';

DELETE FROM animals;

DELETE FROM animals WHERE date_of_birth>'2022-01-01';

SAVEPOINT firstPoint;

 UPDATE animals SET weight_kg=weight_kg * -1;

ROLLBACK to SAVEPOINT firstPoint;

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg<0;

COMMIT;

 SELECT count(name) as name_of_animal FROM animals;

SELECT count(escape_attempts) FROM animals WHERE escape_attempts=0;

SELECT avg(weight_kg) FROM animals;

 SELECT neutered, count(*) as escape_count FROM animals GROUP BY neutere
d order by escape_count desc;

 SELECT species, min(weight_kg) as min_weight, max(weight_kg) as max_wei
ght FROM animals GROUP BY species;

SELECT species, avg(escape_attempts) as avg_esc_attempts FROM animals w
here date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;
