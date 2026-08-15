CREATE TABLE "patients" (
    "patient_id" INTEGER,
    "patient_name" TEXT NOT NULL,
    "patient_dob" NUMERIC,
    "patient_sex" TEXT NOT NULL,
    PRIMARY KEY ("patient_id")
);
CREATE TABLE "samples" (
    "sample_id" TEXT,
    "patient_id" INTEGER,
    "sample_type" TEXT NOT NULL,
    "collection_date" NUMERIC NOT NULL,
    PRIMARY KEY ("sample_id"),
    FOREIGN KEY ("patient_id") REFERENCES patients("patient_id")
);
CREATE TABLE "gene_results" (
    "gene_result_id" INTEGER,
    "sample_id" TEXT NOT NULL,
    "gene_symbol" TEXT NOT NULL,
    "expression_value" NUMERIC NOT NULL,
    PRIMARY KEY ("gene_result_id"),
    FOREIGN KEY ("sample_id") REFERENCES samples("sample_id")
);

INSERT INTO "patients" ("patient_name", "patient_dob", "patient_sex")
SELECT  DISTINCT "patient_name", "patient_dob", "patient_sex"
FROM "patient_sample_gene";

INSERT INTO "samples" ("sample_id", "patient_id", "sample_type", "collection_date")
SELECT DISTINCT 
"patient_sample_gene"."sample_id",
"patients"."patient_id",
"patient_sample_gene"."sample_type",
"patient_sample_gene"."collection_date"
FROM "patient_sample_gene" 
JOIN "patients" ON "patient_sample_gene"."patient_name" = "patients"."patient_name"
AND "patient_sample_gene"."patient_dob" = "patients"."patient_dob";

INSERT INTO "gene_results" ("sample_id", "gene_symbol", "expression_value")
SELECT 
"patient_sample_gene"."sample_id",
"patient_sample_gene"."gene_symbol",
"patient_sample_gene"."expression_value"
FROM "patient_sample_gene";