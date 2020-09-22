SELECT info.symbol, short_name, pb,pe, roe.*, diagnosis.*
FROM info
JOIN roe
ON info.symbol = roe.symbol
JOIN diagnosis
ON info.symbol = diagnosis.symbol
WHERE s1>12
AND s0 >5
AND TYPE ='jjpj'
AND quality_tag ='好公司'
ORDER BY pb

SELECT info.symbol, short_name, pb,pe, roe.*, diagnosis.*
FROM info
JOIN roe
ON info.symbol = roe.symbol
JOIN diagnosis
ON info.symbol = diagnosis.symbol
WHERE info.symbol IN (
SELECT symbol
FROM jlr
WHERE s0 >5
AND s1 >5
AND s2 >5
AND s3 >5
AND s4 >5
AND s5 >5)
AND TYPE = 'tb'
AND quality_tag ='好公司'
AND quality_content LIKE '%低估值%'

SELECT info.symbol, short_name, pb,pe, roe.*, diagnosis.*
FROM info
JOIN roe
ON info.symbol = roe.symbol
JOIN diagnosis
ON info.symbol = diagnosis.symbol
WHERE info.symbol = '300596'
