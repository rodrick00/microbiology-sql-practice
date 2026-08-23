CREATE TABLE "microbiome_abundance" (
    "id" INTEGER,
    "taxon" TEXT NOT NULL,
    "sample_id" INTEGER NOT NULL,
    "relative_abundance" NUMERIC NOT NULL,
    PRIMARY KEY ("id")
);

INSERT INTO "microbiome_abundance" ("taxon", "sample_id", "relative_abundance") 
VALUES
('Bacteroides', 1, 0.35),
('Firmicutes', 1, 0.40),
('Proteobacteria', 1, 0.15),
('Actinobacteria', 1, 0.10),
('Bacteroides', 2, 0.30),
('Firmicutes', 2, 0.45),
('Proteobacteria', 2, 0.18),
('Actinobacteria', 2, 0.07),
('Bacteroides', 3, 0.28),
('Firmicutes', 3, 0.38),
('Proteobacteria', 3, 0.20),
('Actinobacteria', 3, 0.14),
('Bacteroides', 4, 0.33),
('Firmicutes', 4, 0.42),
('Proteobacteria', 4, 0.16),
('Actinobacteria', 4, 0.09),
('Bacteroides', 5, 0.31),
('Firmicutes', 5, 0.39),
('Proteobacteria', 5, 0.19),
('Actinobacteria', 5, 0.11);