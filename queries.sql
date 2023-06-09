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

-- many to many relationship;

SELECT a.name
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'William Tatcher'
ORDER BY v.visit_date DESC
LIMIT 1;


SELECT COUNT(DISTINCT v.animal_id) AS animal_count
FROM visits v
JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'Stephanie Mendez';


SELECT vt.name, s.name
FROM vets vt
LEFT JOIN specializations sp ON vt.id = sp.vet_id
LEFT JOIN species s ON sp.species_id = s.id;


SELECT a.name
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'Stephanie Mendez'
  AND v.visit_date >= '2020-04-01'
  AND v.visit_date <= '2020-08-30';


SELECT a.name, COUNT(*) AS visit_count
FROM animals a
JOIN visits v ON a.id = v.animal_id
GROUP BY a.name
ORDER BY visit_count DESC
LIMIT 1;



SELECT a.name, MIN(v.visit_date) AS first_visit
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'Maisy Smith'
GROUP BY a.name
ORDER BY first_visit ASC
LIMIT 1;

SELECT a.name AS animal_name, v.visit_date, vt.name AS vet_name, vt.age AS vet_age
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vt ON v.vet_id = vt.id
WHERE v.visit_date = (
    SELECT MAX(visit_date)
    FROM visits
)
LIMIT 1;

SELECT COUNT(*) AS num_visits
FROM visits v
JOIN vets vt ON v.vet_id = vt.id
JOIN animals a ON v.animal_id = a.id
JOIN specializations s ON vt.id = s.vet_id AND a.id = s.species_id
WHERE s.species_id IS NULL;

SELECT a.name, COUNT(*) AS num_visits
FROM visits v
JOIN animals a ON v.animal_id = a.id
JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'Maisy Smith'
GROUP BY a.name
ORDER BY num_visits DESC
LIMIT 1;

explain analyze SELECT COUNT(*) FROM visits where animal_id = 4;

explain analyze SELECT * FROM visits where vet_id = 2;

explain analyze SELECT * FROM owners where email = 'owner_18327@mail.com';