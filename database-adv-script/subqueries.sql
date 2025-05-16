--AVG > 4.0 rating
SELECT *
FROM properties
WHERE id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
)
ORDER BY id;

-- >3 bookings
SELECT * 
FROM users
WHERE(
    SELECT COUNT(*)
    FROM bookings
    WHERE booking.user_id = users.id
) > 3
ORDER BY users.id;
