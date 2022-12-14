CREATE TABLE STUDENT
(ID INT, NAME VARCHAR(20), MARKS INT)

INSERT INTO STUDENT
VALUES (1,'Julia', 88),
	   (2,'Samantha', 68),
	   (3, 'Maria', 99),
	   (4,'Scarlet', 78),
	   (5, 'Ashley', 63),
	   (6, 'Jane', 81)

go
CREATE TABLE GRADES
(GRADE TINYINT, MIN_MARK TINYINT, MAX_MARK TINYINT)

INSERT INTO GRADES
VALUES (1,0,9),
	   (2,10,19),
	   (3,20,29),
	   (4,30,39),
	   (5,40,49),
	   (6,50,59),
	   (7,60,69),
	   (8,70,79),
	   (9,80,89),
	   (10,90,100)

GO
SELECT(CASE WHEN G.GRADE < 8 THEN NULL
			ELSE S.NAME
			END) AS NAMEST,
		G.GRADE, S.MARKS
FROM STUDENT AS S JOIN GRADES AS G
ON S.MARKS BETWEEN G.MIN_MARK AND G.MAX_MARK
ORDER BY GRADE DESC, NAMEST ASC, MARKS
