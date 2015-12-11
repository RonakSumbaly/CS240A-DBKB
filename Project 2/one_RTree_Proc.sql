CREATE OR REPLACE PROCEDURE 
GET_ACCURACY_1R_TREE(OUT TOTAL_ROWS DECIMAL, OUT ACCURATE_ROWS DECIMAL, OUT ACCURACY Decimal(18, 13))
BEGIN

SELECT DECIMAL(COUNT(DISTINCT T.PID)) INTO ACCURATE_ROWS 
FROM  TEST_DATASET AS T , SPLIT_ATTR AS S, FREQUENT_CLASS AS F 
WHERE T.COLUMNNO=S.COLNO AND F.COLUMNNO=S.COLNO AND T.COLUMNNO=F.COLUMNNO AND T.ATT=F.ATT AND T.DECISION=F.DECISION;

SELECT DECIMAL(COUNT(DISTINCT PID)) INTO TOTAL_ROWS FROM TEST_DATASET;

SET ACCURACY=(ACCURATE_ROWS/TOTAL_ROWS)*100;

END@


