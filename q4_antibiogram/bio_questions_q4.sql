.mode table

--INNER JOIN isolates + zones on isolate_id
SELECT "isolates"."isolate_id","isolates"."species_name","zones"."antibiotic_id","zones"."zone_diameter" 
FROM "isolates"
INNER JOIN "zones" ON "isolates"."isolate_id" = "zones"."isolate_id";

--LEFT JOIN to find isolates with no zone measurements recorded
SELECT "isolates"."isolate_id","isolates"."species_name","zones"."antibiotic_id","zones"."zone_diameter" 
FROM "isolates"
LEFT JOIN "zones" ON "isolates"."isolate_id" = "zones"."isolate_id"
WHERE "zones"."zone_diameter" IS NULL;

--One query joining all three tables
SELECT "isolates"."isolate_id","isolates"."species_name",
"antibiotics"."antibiotic_name","antibiotics"."class","zones"."zone_diameter" 
FROM "isolates"
JOIN "zones" ON "isolates"."isolate_id" = "zones"."isolate_id"
JOIN "antibiotics" ON "antibiotics"."antibiotic_id" = "zones"."antibiotic_id";

--INTERSECT — isolates tested with BOTH Ciprofloxacin AND Gentamicin
SELECT "isolates"."isolate_id","isolates"."species_name" FROM "isolates"
WHERE "isolates"."isolate_id" IN (
    SELECT "zones"."isolate_id"
    FROM "zones"
    JOIN "antibiotics" ON "antibiotics"."antibiotic_id" = "zones"."antibiotic_id"
    WHERE "antibiotics"."antibiotic_name" = 'Ciprofloxacin'
    INTERSECT
    SELECT "zones"."isolate_id"
    FROM "zones"
    JOIN "antibiotics" ON "antibiotics"."antibiotic_id" = "zones"."antibiotic_id" 
    WHERE "antibiotics"."antibiotic_name" = 'Gentamicin'
);

--EXCEPT — isolates tested with Ciprofloxacin but NOT Gentamicin
SELECT "isolates"."isolate_id","isolates"."species_name" FROM "isolates"
WHERE "isolates"."isolate_id" IN (
    SELECT "zones"."isolate_id"
    FROM "zones"
    JOIN "antibiotics" ON "antibiotics"."antibiotic_id" = "zones"."antibiotic_id"
    WHERE "antibiotics"."antibiotic_name" = 'Ciprofloxacin'
    EXCEPT
    SELECT "zones"."isolate_id"
    FROM "zones"
    JOIN "antibiotics" ON "antibiotics"."antibiotic_id" = "zones"."antibiotic_id" 
    WHERE "antibiotics"."antibiotic_name" = 'Gentamicin'
);

