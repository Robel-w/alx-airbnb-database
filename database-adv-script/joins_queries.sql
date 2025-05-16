
--INNER JOIN
SELECT 
    bookings.id AS booking_id,
    users.id AS user_id,
    users.username,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date
FROM 
    bookings
INNER JOIN 
    users ON bookings.user_id = users.id;

--LEFT JOIN 
SELECT
    properties.id AS properties_id,
    properties.title,
    reviews.id AS review_id,
    reviews.comment,
    reviews.rating
FROM
    properties
LEFT JOIN
    reviews ON reviews.property_id = properties.id;

--FULL OUTER JOIN
SELECT 
    users.id AS user_id,
    users.username,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date
FROM 
    users
FULL OUTER JOIN 
    bookings ON users.id = bookings.user_id;



