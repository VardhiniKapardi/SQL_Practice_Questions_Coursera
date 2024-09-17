-----------------------------------
-----------------------------------
------- PRACTICE QUESTIONS --------
-----------------------------------
-----------------------------------

-- Q1: Find the total milk production for the year 2023.
SELECT SUM(Value) 
FROM milk_production 
WHERE Year = 2023;
-------- Answer: 91812000000 -------------

-- Q2: Show coffee production data for the year 2015. What is the total value?
SELECT SUM(Value)
FROM coffee_production 
WHERE Year = 2015;
-------- Answer: 6600000 -------------

-- Q3: Find the average honey production for the year 2022.
SELECT avg(value) 
FROM honey_production 
WHERE YEAR = 2022;
--------- Answer: 3133275 --------------

-- Q4: Get the state names with their corresponding ANSI codes 
-- from the state_lookup table.
-- What number is Iowa?
SELECT *
FROM state_lookup;
------- Answer : 19 ---------------

-- Q5: Find the highest yogurt production value for the year 2022.
SELECT max(value)
FROM yogurt_production 
WHERE YEAR = 2022;
--------- Answer:  793,256,000 --------------

-- Q6: Find states where both honey and milk were produced in 2022.
-- Did State_ANSI "35" produce both honey and milk in 2022?
SELECT DISTINCT hp.state_ansi FROM honey_production hp 
JOIN milk_production mp ON hp.State_ANSI = mp.State_ANSI 
WHERE hp.YEAR = 2022 AND mp.YEAR = 2022;
------- Answer : No -----------------------------

-- Q7: Find the total yogurt production for states that also produced cheese in 2022.
SELECT SUM(yp.value)
FROM yogurt_production yp 
WHERE yp."Year" = 2022 AND yp.State_ANSI 
IN (
	SELECT DISTINCT c.state_ansi 
	FROM cheese_production c
	WHERE c.YEAR = 2022
);
---- Answer: 1171095000 -----------