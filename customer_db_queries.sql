--Create Database
CREATE DATABASE food_delivery_analysis;
USE food_delivery_analysis;

--Create Table
CREATE TABLE food_orders (
    Age INT,
    Gender VARCHAR(20),
    Marital_Status VARCHAR(20),
    Occupation VARCHAR(50),
    Monthly_Income VARCHAR(50),
    Education VARCHAR(50),
    Family_Size INT,
    Latitude DECIMAL(10,6),
    Longitude DECIMAL(10,6),
    Pin_Code INT,
    Output VARCHAR(20),
    Feedback VARCHAR(20),
    Repeat_Order VARCHAR(10),
    Age_Group VARCHAR(20),
    Income_Band INT
);

--Analysis

--Total Customers
SELECT COUNT(*) AS Total_Customers
FROM food_orders;

--Gender Distribution
SELECT Gender, COUNT(*) AS Total
FROM food_orders
GROUP BY Gender;

--Age Group Analysis
SELECT Age_Group, COUNT(*) AS Total_Orders
FROM food_orders
GROUP BY Age_Group
ORDER BY Total_Orders DESC;

--Occupation Distribution
SELECT Occupation, COUNT(*) AS Total_Orders
FROM food_orders
GROUP BY Occupation
ORDER BY Total_Orders DESC;

--Income Category Distribution
SELECT Monthly_Income, COUNT(*) AS Total_Customers
FROM food_orders
GROUP BY Monthly_Income
ORDER BY Total_Customers DESC;

--Education Analysis
SELECT Education, COUNT(*) AS Total
FROM food_orders
GROUP BY Education
ORDER BY Total DESC;

--Family size Analysis
SELECT Family_Size, COUNT(*) AS Total
FROM food_orders
GROUP BY Family_Size
ORDER BY Total DESC;

--Repeat Order Analysis
SELECT Repeat_Order, COUNT(*) AS Total
FROM food_orders
GROUP BY Repeat_Order;

--Feedback Analysis
SELECT Feedback, COUNT(*) AS Total
FROM food_orders
GROUP BY Feedback;

--Repeat Order vs feedback
SELECT Repeat_Order, Feedback, COUNT(*) AS Total
FROM food_orders
GROUP BY Repeat_Order, Feedback
ORDER BY Total DESC;

--Occupation vs repeat orders
SELECT Occupation, Repeat_Order, COUNT(*) AS Total
FROM food_orders
GROUP BY Occupation, Repeat_Order
ORDER BY Total DESC;

--Gender vs repeat orders
SELECT Gender, Repeat_Order, COUNT(*) AS Total
FROM food_orders
GROUP BY Gender, Repeat_Order;

--Age Group vs feedback
SELECT Age_Group, Feedback, COUNT(*) AS Total
FROM food_orders
GROUP BY Age_Group, Feedback
ORDER BY Total DESC;

--Income vs repeat orders
SELECT Monthly_Income, Repeat_Order, COUNT(*) AS Total
FROM food_orders
GROUP BY Monthly_Income, Repeat_Order
ORDER BY Total DESC;

--Occupation vs feedback
SELECT Occupation, Feedback, COUNT(*) AS Total
FROM food_orders
GROUP BY Occupation, Feedback
ORDER BY Total DESC;

--Top customer segment
SELECT Age_Group, Occupation, COUNT(*) AS Total
FROM food_orders
GROUP BY Age_Group, Occupation
ORDER BY Total DESC
LIMIT 5;

--Positive feedback percentage
SELECT 
    ROUND(
        (COUNT(CASE WHEN Feedback='Positive' THEN 1 END) * 100.0) / COUNT(*),
        2
    ) AS Positive_Feedback_Percentage
FROM food_orders;

--Repeat customer percentage
SELECT 
    ROUND(
        (COUNT(CASE WHEN Repeat_Order='Yes' THEN 1 END) * 100.0) / COUNT(*),
        2
    ) AS Repeat_Customer_Percentage
FROM food_orders;