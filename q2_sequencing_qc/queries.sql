SELECT "platform", AVG("quality_score") AS 'average_quality_score' FROM "sequencing_runs"
GROUP BY "platform";

SELECT "platform", COUNT("run_id") AS 'total_runs' FROM "sequencing_runs"                
GROUP BY "platform";

SELECT "platform", AVG(COALESCE("quality_score",0)) AS 'real_average_quality_score' FROM "sequencing_runs"  
GROUP BY "platform";