.mode table
SELECT "isolates"."isolate_id","isolates"."species_name","zones"."zone_id",ROUND(AVG("zones"."zone_diameter"),2) FROM "isolates"
JOIN "zones" ON "isolates"."isolate_id"= "zones"."isolate_id"
GROUP BY "isolates"."isolate_id"
HAVING ROUND(AVG("zones"."zone_diameter"),2) < (
    SELECT ROUND(AVG("zone_diameter"),2) FROM "zones"
);