CREATE TABLE WANDS
(ID INT, CODE INT, COINS_NEEDED INT, POW_ER  INT)

CREATE TABLE WANDS_PROPERTY
(CODE INT, AGE INT, IS_EVIL INT)

INSERT INTO WANDS
VALUES (1,4,3688,8),
       (2,3,9365,3),
	   (3,3,7187,10),
	   (4,3,734,8),
	   (5,1,6020,2),
	   (6,2,6773,7),
	   (7,3,9873,9),
	   (8,3,7721,7),
	   (9,1,1647,10),
	   (10,4,505,5),
	   (11,2,7587,5),
	   (12,5,9897,10),
	   (13,3,4651,8),
	   (14,2,5408,1),
	   (15,2,6018,7),
	   (16,4,7710,5),
	   (17,2,8798,7),
	   (18,2,3312,3),
	   (19,4,7651,6),
	   (20, 5, 5689, 3)

GO
INSERT INTO WANDS_PROPERTY
VALUES(1,45,0),
	  (2,40,0),
	  (3,4,1),
	  (4,20,0),
	  (5,17,0)

GO
WITH 
Table1 as (SELECT WP.AGE, W.POW_ER, MIN(W.COINS_NEEDED) AS COINS
FROM WANDS AS W JOIN WANDS_PROPERTY AS WP ON W.CODE = WP.CODE
where wp.IS_EVIL = 0  
GROUP BY WP.AGE, W.POW_ER),-- BECAUSE age and power HAVE DUPLICATE VALUES	  
Table2 as 
(select id, AGE, COINS_NEEDED, w.POW_ER FROM WANDS AS W JOIN WANDS_PROPERTY AS WP ON W.CODE = WP.CODE)

SELECT T2.ID, T1.AGE, T1.COINS, T1.POW_ER 
FROM Table1 AS	T1 JOIN Table2 as T2
on T1.AGE = T2.AGE AND T1.POW_ER = T2.POW_ER AND T1.COINS =T2.COINS_NEEDED
ORDER BY T1.POW_ER DESC, T1.AGE DESC;
