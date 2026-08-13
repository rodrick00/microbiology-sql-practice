PRAGMA foreign_keys = ON;
CREATE TABLE "isolates" (
    "isolate_id" INTEGER,
    "species_name" TEXT NOT NULL,
    "patient_id" INTEGER,
    "collection_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("isolate_id")
);
CREATE TABLE "antibiotics" (
    "antibiotic_id" INTEGER,
    "antibiotic_name" TEXT NOT NULL UNIQUE,
    "class" TEXT,
    PRIMARY KEY ("antibiotic_id")
);
CREATE TABLE "zones"(
    "zone_id" INTEGER,
    "isolate_id" INTEGER,
    "antibiotic_id" INTEGER,
    "zone_diameter" NUMERIC NOT NULL,
    PRIMARY KEY ("zone_id"),
    FOREIGN KEY ("isolate_id") REFERENCES "isolates"("isolate_id"),
    FOREIGN KEY ("antibiotic_id") REFERENCES "antibiotics"("antibiotic_id")
);

INSERT INTO "isolates" ("species_name", "patient_id", "collection_date")
VALUES
('Escherichia coli', 3001, '2026-05-12'),
('Staphylococcus aureus', 3002, '2026-05-19'),
('Pseudomonas aeruginosa', 3003, '2026-06-02'),
('Klebsiella pneumoniae', 3004, '2026-06-15'),
('Enterococcus faecalis', 3005, '2026-07-01');

INSERT INTO "antibiotics" ("antibiotic_name", "class")
VALUES 
('Amoxicillin', 'Penicillin'),
('Ciprofloxacin', 'Fluoroquinolone'),
('Gentamicin', 'Aminoglycoside'),
('Vancomycin', 'Glycopeptide'),
('Imipenem', 'Carbapenem');

INSERT INTO "zones"("isolate_id", "antibiotic_id", "zone_diameter")
VALUES 
(1, 1, 18),
(1, 2, 26),
(1, 3, 0),
(2, 1, 0),
(2, 4, 22),
(2, 5, 30),
(3, 2, 14),
(3, 3, 20),
(3, 5, 28),
(4, 1, 12),
(4, 3, 16),
(4, 5, 0),
(5, 2, 0),
(5, 4, 19),
(5, 5, 25);
  
-- One isolates can have multiple antibiotics and one antibiotic can have mutiple isolates
-- so we create junction table zones

-- Isolate Side : One isolate can have multiple zones,
-- but one specific zone row belongs to only one isolate.

--Antibiotic Side : One antibiotic can have multiple zones,
-- but one specific zone row belongs to only one antibiotic.
