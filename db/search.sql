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