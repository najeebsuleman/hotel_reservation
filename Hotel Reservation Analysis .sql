SELECT * FROM Mentorness.hotel_reservation_dataset;

-- 1. What is the total number of reservations in the dataset?

SELECT COUNT(*) AS 'Number of Reservation' 
FROM hotel_reservation_dataset;


-- 2. Which meal plan is the most popular among guests?

SELECT type_of_meal_plan AS 'Popular Meal',
COUNT(*) AS 'Orders Count'
FROM hotel_reservation_dataset
WHERE type_of_meal_plan <> 'Not Selected'
GROUP BY type_of_meal_plan
LIMIT 1;

-- 3. What is the average price per room for reservations involving children?

SELECT ROUND(AVG(avg_price_per_room)) AS 'Average Room Price With Children'
FROM hotel_reservation_dataset
WHERE no_of_children > 0;

-- 4 How many reservations were made for the year 20XX (replace XX with the desired year)?

SELECT COUNT(*) AS 'Total Reservation 2018'
FROM hotel_reservation_dataset
WHERE YEAR(STR_TO_DATE(arrival_date, '%d-%m-%Y')) = 2018;

-- 5. What is the most commonly booked room type?

SELECT room_type_reserved AS 'Commonly Room Reserved Type',
COUNT(*) AS Count
FROM hotel_reservation_dataset
GROUP BY room_type_reserved
LIMIT 1;

-- 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?

SELECT COUNT(*) AS 'Reservation on weekend'
FROM hotel_reservation_dataset
WHERE no_of_weekend_nights > 0;

-- 7. What is the highest and lowest lead time for reservations?

SELECT 
MAX(lead_time) AS 'Highest Lead Time',
MIN(lead_time) AS 'Lowest Lead Time'
FROM hotel_reservation_dataset;

-- 8. What is the most common market segment type for reservations?

SELECT market_segment_type AS 'Common Market Segment Type',
COUNT(*) AS 'Count'
FROM hotel_reservation_dataset
GROUP BY market_segment_type
ORDER BY count DESC
LIMIT 1;

-- 9. How many reservations have a booking status of "Confirmed"?

SELECT COUNT(*) AS 'Booking Status'
FROM hotel_reservation_dataset
WHERE booking_status = 'Not_Canceled';

-- 10. What is the total number of adults and children across all reservations?

SELECT
SUM(no_of_adults) AS 'Number of Adults',
SUM(no_of_children) AS 'Number of Children',
SUM(no_of_adults) + SUM(no_of_children) AS 'Total Number Of All Reservation'
FROM hotel_reservation_dataset;

-- 11. What is the average number of weekend nights for reservations involving children?

SELECT AVG(no_of_weekend_nights) AS 'Average No Reservation'
FROM hotel_reservation_dataset
WHERE no_of_weekend_nights > 0 AND no_of_children > 0;

-- 12. How many reservations were made in each month of the year?

SELECT MONTH(STR_TO_DATE(arrival_date, '%d-%m-%y')) AS MONTH,
COUNT(*) AS 'Total Reservation'
FROM hotel_reservation_dataset
GROUP BY MONTH
ORDER BY MONTH;

-- 13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?

SELECT room_type_reserved AS 'Room Type',
ROUND(AVG(no_of_weekend_nights + no_of_week_nights),2) AS 'No Nights'
FROM hotel_reservation_dataset
GROUP BY room_type_reserved
ORDER BY room_type_reserved;


-- 14. For reservations involving children, what is the most common room type, and what is the average price for that room type?

SELECT room_type_reserved AS 'Room Type Reserved',
COUNT(*) AS COUNT,
AVG(avg_price_per_room) AS 'Average Price Per Room'
FROM hotel_reservation_dataset
WHERE no_of_children > 0
GROUP BY room_type_reserved
ORDER BY room_type_reserved;

-- 15. Find the market segment type that generates the highest average price per room.

SELECT market_segment_type AS 'Market Segment',
ROUND(AVG(avg_price_per_room),2) AS 'Average Price Per Room'  
FROM hotel_reservation_dataset
GROUP BY market_segment_type;