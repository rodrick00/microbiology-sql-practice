-- Part 1: a transaction that succeeds
BEGIN TRANSACTION;
INSERT INTO "isolates" ("species_name","patient_id","collection_date")
VALUES 
('Acinetobacter baumannii', 4001, '2026-07-10'),
('Proteus mirabilis', 4002, '2026-07-11');
COMMIT;
--To verify:
SELECT * FROM "isolates";

-- Part 2: a transaction we deliberately rollback
BEGIN TRANSACTION;
INSERT INTO "isolates" ("species_name","patient_id","collection_date")
VALUES ('Serratia marcescens', 4003, '2026-07-12');
--To verify: row exists inside the still-open transaction
SELECT * FROM "isolates"; 

ROLLBACK;

-- verify: this row is now be GONE
SELECT * FROM "isolates";