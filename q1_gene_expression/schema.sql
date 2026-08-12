CREATE TABLE "gene_expression" (
    "sample_id" INTEGER,
    "gene_name" TEXT NOT NULL,
    "expression_level" NUMERIC,
    "tissue_type" TEXT,
    PRIMARY KEY("sample_id")
);

INSERT INTO "gene_expression"("sample_id","gene_name","expression_level","tissue_type")
VALUES
(1, 'acrA_1', 65.2, 'gut'),
(2, 'acrA_2', 45.0, 'liver'),
(3, 'gapdh', 110.0, 'gut'),
(4, 'acrA_3', 82.1, 'gut'),
(5, 'acrA_4', 95.0, 'liver');