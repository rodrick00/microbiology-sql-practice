SELECT * FROM "gene_expression"
WHERE "expression_level" BETWEEN 50 AND 100;

SELECT * FROM "gene_expression"  
WHERE "gene_name" LIKE 'acrA%';

SELECT * FROM "gene_expression"
WHERE ("tissue_type"='gut') AND ("expression_level">75);