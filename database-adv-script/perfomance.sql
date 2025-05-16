-- Step 1: Initial query retrieving bookings with user, property, payment details

SELECT 
    bookings.id AS booking_id,
    users.id AS user_id,
    users.name AS user_name,
    properties.id AS property_id,
    properties.name AS property_name,
    payments.id AS payment_id,
    payments.amount AS payment_amount,
    bookings.booking_date
FROM bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
JOIN payments ON bookings.payment_id = payments.id;

-- Step 2: Analyze the query performance
EXPLAIN
SELECT 
    bookings.id AS booking_id,
    users.id AS user_id,
    users.name AS user_name,
    properties.id AS property_id,
    properties.name AS property_name,
    payments.id AS payment_id,
    payments.amount AS payment_amount,
    bookings.booking_date
FROM bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
JOIN payments ON bookings.payment_id = payments.id;

-- Step 3: Create indexes to optimize query performance

CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_payment_id ON bookings(payment_id);
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);

