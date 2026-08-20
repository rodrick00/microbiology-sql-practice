CREATE VIEW "resistant_isolates" AS 
SELECT "isolates"."isolate_id","isolates"."species_name",
"antibiotics"."antibiotic_name","antibiotics"."class",
"zones"."zone_diameter"
FROM "zones"
JOIN "isolates" ON "isolates"."isolate_id" = "zones"."isolate_id"
JOIN "antibiotics" ON "antibiotics"."antibiotic_id" = "zones"."antibiotic_id"
WHERE "zones"."zone_diameter"  <= 14;
