-- Total number of booking per user
SELECT 
    user_id,
    COUNT(*) AS total_bookings
FROM bookings
GROUP BY user_id
ORDER BY total_bookings DESC;

--Rank properties by total number of Bookings
SELECT 
    property_id,
    COUNT(*) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
FROM bookings
GROUP BY property_id
ORDER BY booking_rank;
