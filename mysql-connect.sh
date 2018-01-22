#fejiebae2oox1Shav7eiS
mysql -h ms-mysql-hmg.c1prvhiytlhr.sa-east-1.rds.amazonaws.com -u rating -D rating -p

SELECT COUNT(1), SUBSTR(internalDate, 1, 7), app, platform, grade
FROM Ratings
GROUP BY app, platform, SUBSTR(internalDate, 1, 7), grade;
SELECT COUNT(1), SUBSTR(internalDate, 1, 7), app, platform, grade FROM Ratings GROUP BY app, platform, SUBSTR(internalDate, 1, 7), grade;