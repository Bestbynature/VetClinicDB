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

-- foreign key

SELECT a.name
FROM animals a
JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Melody Pond';


SELECT a.name
FROM animals a
JOIN species s ON a.species_id = s.id
WHERE s.name = 'Pokemon';

SELECT o.full_name, a.name
FROM owners o
LEFT JOIN animals a ON o.id = a.owner_id;


SELECT s.name, COUNT(*) AS animal_count
FROM species s
JOIN animals a ON s.id = a.species_id
GROUP BY s.name;


SELECT a.name
FROM animals a
JOIN owners o ON a.owner_id = o.id
JOIN species s ON a.species_id = s.id
WHERE o.full_name = 'Jennifer Orwell' AND s.name = 'Digimon';


SELECT a.name
FROM animals a
JOIN owners o ON a.owner_id = o.id
JOIN species s ON a.species_id = s.id
WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;



SELECT o.full_name, COUNT(*) AS animal_count
FROM owners o
JOIN animals a ON o.id = a.owner_id
GROUP BY o.full_name
ORDER BY animal_count DESC
LIMIT 1;
