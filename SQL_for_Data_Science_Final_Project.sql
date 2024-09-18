------------------------------------
------------------------------------
---------- FINAL PROJECT -----------
------------------------------------
------------------------------------

-- Q1: Can you find out the total milk production for 2023? 
-- Your manager wants this information for the yearly report. 
-- What is the total milk production for 2023?
SELECT SUM(Value)
FROM milk_production 
WHERE YEAR = 2023;
------ Answer: 91812000000 ---------

-- Q2:Which states had cheese production greater than 100 million in April 2023? 
-- The Cheese Department wants to focus their marketing efforts there.
-- How many states are there?
SELECT DISTINCT COUNT(State_ansi)
FROM cheese_production 
WHERE value >= 100000000 AND Year = 2023;
----------- Answer : 13 -----------------------

-- Q3: Your manager wants to know how coffee production has changed over the years.
--  What is the total value of coffee production for 2011?
SELECT YEAR, SUM(Value) 
FROM coffee_production cp 
GROUP BY YEAR;
----------- Answer: 7600000 ---------------

-- Q4: There's a meeting with the Honey Council next week. 
-- Find the average honey production for 2022 so you're prepared.
SELECT avg(value)
FROM honey_production 
WHERE YEAR = 2022;
------------- Answer: 3133275 -------------------

-- Q5: The State Relations team wants a list of all states 
-- names with their corresponding ANSI codes. Can you generate that list?
-- What is the State_ANSI code for Florida?
SELECT *
FROM state_lookup;
-----------Answer: 12 ------------------------------

-- Q6: For a cross-commodity report, can you list all states with their cheese production values, 
-- even if they didn't produce any cheese in April of 2023?
-- What is the total for NEW JERSEY?
SELECT s.State, c.Value
FROM state_lookup s
LEFT JOIN cheese_production c 
ON s.State_ANSI = c.State_ANSI 
AND c.YEAR = 2023 AND c.Period = 'APR';
-------------- Answer: 4889000 --------------------

-- Q7: Can you find the total yogurt production for states in the year 2022
-- which also have cheese production data from 2023? 
-- This will help the Dairy Division in their planning.
SELECT SUM(y.Value)
FROM yogurt_production y
WHERE y.Year = 2022 AND y.State_ANSI IN (
    SELECT DISTINCT c.State_ANSI FROM cheese_production c WHERE c.Year = 2023);
---------------- Answer: 1171095000 ----------------

-- Q8: List all states from state_lookup that are missing from milk_production in 2023.
-- How many states are there?
SELECT COUNT(sl.State) 
FROM state_lookup sl 
LEFT JOIN milk_production mp 
ON sl.State_ANSI = mp.State_ANSI 
AND mp.YEAR = 2023
WHERE mp.State_ANSI IS NULL;
---------------- Answer: 26 --------------------------

-- Q9: List all states with their cheese production values, 
-- including states that didn't produce any cheese in April 2023.
-- Did Delaware produce any cheese in April 2023?
SELECT sl.State, cp.Value
FROM state_lookup sl 
LEFT JOIN cheese_production cp 
ON sl.State_ANSI = cp.State_ANSI 
AND cp."Year" = 2023 AND cp.Period = 'APR';
-------------------- Answer: No ----------------------------

-- Q10 : Find the average coffee production for all years 
-- where the honey production exceeded 1 million.
SELECT AVG(cp.Value) 
FROM coffee_production cp 
WHERE cp.Year 
IN (
SELECT hp.Year 
FROM honey_production hp 
GROUP BY hp.Year 
HAVING SUM(hp.Value) > 1000000);
--------------------Answer: 6426666.666666667----------------