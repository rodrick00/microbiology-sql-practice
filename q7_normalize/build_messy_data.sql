CREATE TABLE "patient_sample_gene" (
    "patient_name" TEXT,
    "patient_dob" TEXT,
    "patient_sex" TEXT,
    "sample_id" TEXT,
    "sample_type" TEXT,
    "collection_date" TEXT,
    "gene_symbol" TEXT,
    "expression_value" NUMERIC
);

INSERT INTO "patient_sample_gene"
("patient_name","patient_dob","patient_sex",
"sample_id","sample_type","collection_date",
"gene_symbol","expression_value")
VALUES
('Alisha kaneez','1985-03-14','F','S1001','Blood','2026-07-01','BRCA1',2.3),
('Alisha kaneez','1985-03-14','F','S1001','Blood','2026-07-01','TP53',1.1),
('Alisha kaneez','1985-03-14','F','S1001','Blood','2026-07-01','EGFR',0.8),
('Alisha kaneez','1985-03-14','F','S1002','Tissue','2026-07-10','BRCA1',2.5),
('Alisha kaneez','1985-03-14','F','S1002','Tissue','2026-07-10','TP53',1.0),
('Alisha kaneez','1985-03-14','F','S1002','Tissue','2026-07-10','EGFR',0.9),
('Ravi kishan','1990-11-02','M','S1003','Blood','2026-07-05','BRCA1',1.8),
('Ravi kishan','1990-11-02','M','S1003','Blood','2026-07-05','TP53',1.4),
('Ravi kishan','1990-11-02','M','S1003','Blood','2026-07-05','EGFR',1.2);
