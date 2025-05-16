-- Initial query retrieving all bookings with user, property, and payment details
-- Filtering for bookings in the last 30 days and payments completed

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
JOIN payments ON bookings.payment_id = payments.id
WHERE bookings.booking_date >= CURRENT_DATE - INTERVAL '30 days'
  AND payments.status = 'completed';

-- Analyze the query performance
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
JOIN payments ON bookings.payment_id = payments.id
WHERE bookings.booking_date >= CURRENT_DATE - INTERVAL '30 days'
  AND payments.status = 'completed';

-- Create indexes to optimize the query
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_payment_id ON bookings(payment_id);
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);
CREATE INDEX idx_payments_status ON payments(status);
