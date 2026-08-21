-- antibiotic_name → showed no change, because UNIQUE already gave it a hidden index

EXPLAIN QUERY PLAN
SELECT * FROM "isolates" 
WHERE "species_name" = 'Escherichia coli';
-- QUERY PLAN
--`--SCAN isolates

CREATE INDEX "species_name_index" ON "isolates"("species_name");

EXPLAIN QUERY PLAN
SELECT * FROM "isolates" 
WHERE "species_name" = 'Escherichia coli';
--QUERY PLAN
--`--SEARCH isolates USING INDEX species_name_index (species_name=?)
