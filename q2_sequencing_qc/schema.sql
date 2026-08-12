CREATE TABLE "sequencing_runs" (
    "run_id" TEXT,
    "sample_id" TEXT,
    "read_count" NUMERIC,
    "quality_score" NUMERIC,
    "platform" TEXT,
    PRIMARY KEY ("run_id")
);

INSERT INTO "sequencing_runs" ("run_id","sample_id" ,"read_count","quality_score","platform")
VALUES 
('R1', 'S1', 1500000, 34.2, 'Illumina'),
('R2', 'S2', 800000, NULL, 'Illumina'), 
('R3', 'S3', 2200000, 28.5, 'PacBio'),
('R4', 'S4', 1900000, 31.1, 'PacBio');