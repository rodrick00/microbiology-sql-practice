ALTER TABLE "zones" ADD COLUMN "is_deleted" INTEGER NOT NULL DEFAULT 0;

CREATE TABLE "zone_diameter_log" (
    "log_id" INTEGER,
    "zone_id" INTEGER NOT NULL,
    "antibiotic_id" INTEGER,
    "isolate_id" INTEGER,
    "old_value" NUMERIC,
    "new_value" NUMERIC,
    "changed_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("log_id")
);

CREATE TRIGGER "zone_diameter_log_update" 
AFTER UPDATE OF "zone_diameter" ON "zones"
FOR EACH ROW
WHEN OLD."zone_diameter" IS NOT NEW."zone_diameter"
BEGIN
INSERT INTO "zone_diameter_log" ("zone_id", "isolate_id", "antibiotic_id", "old_value", "new_value")
VALUES (OLD."zone_id",OLD."isolate_id",OLD."antibiotic_id",OLD."zone_diameter",NEW."zone_diameter");
END;