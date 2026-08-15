-- UPDATE: isolate 1 was re-tested against Gentamicin, came back 15mm
UPDATE "zones"
SET "zone_diameter" = 15
WHERE "isolate_id" = 1 AND "antibiotic_id" = 3;

--The realistic scenario: say the lab flags isolate 5 (Enterococcus faecalis) as contaminated
--  the sample got mixed up in processing, so every result from it is unreliable and needs to be thrown out
-- entirely, not just corrected.
-- Step 1: child table first
 DELETE FROM "zones"
 WHERE "isolate_id" = 5;
 -- Step 2: parent table second
 DELETE FROM "isolates"
 WHERE "isolate_id" = 5 ;

 -- CSV import: add 2 new isolates from new_isolates.csv
 CREATE TABLE "isolates_staging" (
    "species_name" TEXT,
    "patient_id" INTEGER,
    "collection_date" TEXT
);
.import --csv --skip 1 new_isolates.csv isolates_staging

INSERT INTO "isolates" ("species_name", "patient_id", "collection_date")
SELECT "species_name", "patient_id", "collection_date"
FROM "isolates_staging";

DROP TABLE "isolates_staging";
