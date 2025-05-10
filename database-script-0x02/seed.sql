## Inserting users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  (UUID(), 'Robel', 'Johnson', 'robel.johnson@example.com', 'hashedpassword123', '123-456-7890', 'guest'),
  (UUID(), 'Bob', 'Smith', 'bob.smith@example.com', 'hashedpassword456', '098-765-4321', 'host'),
  (UUID(), 'Charlie', 'Brown', 'charlie.brown@example.com', 'hashedpassword789', '321-654-9870', 'admin'),
  (UUID(), 'Diana', 'Davis', 'diana.davis@example.com', 'hashedpassword321', '987-654-3210', 'host');

## Inserting properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
  (UUID(), (SELECT user_id FROM User WHERE email = 'bob.smith@example.com'), 'Sunny Villa', 'A beautiful villa with a pool and a garden', 'Los Angeles, CA', 250.00),
  (UUID(), (SELECT user_id FROM User WHERE email = 'diana.davis@example.com'), 'Mountain Retreat', 'A cozy cabin in the mountains, perfect for a weekend getaway', 'Denver, CO', 180.00);

## Inserting bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  (UUID(), (SELECT property_id FROM Property WHERE name = 'Sunny Villa'), (SELECT user_id FROM User WHERE email = 'robel.johnson@example.com'), '2025-05-15', '2025-05-20', 1250.00, 'confirmed'),
  (UUID(), (SELECT property_id FROM Property WHERE name = 'Mountain Retreat'), (SELECT user_id FROM User WHERE email = 'robel.johnson@example.com'), '2025-06-01', '2025-06-05', 900.00, 'pending');

## Inserting payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
  (UUID(), (SELECT booking_id FROM Booking WHERE property_id = (SELECT property_id FROM Property WHERE name = 'Sunny Villa')), 1250.00, 'credit_card'),
  (UUID(), (SELECT booking_id FROM Booking WHERE property_id = (SELECT property_id FROM Property WHERE name = 'Mountain Retreat')), 900.00, 'paypal');

## Inserting reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
  (UUID(), (SELECT property_id FROM Property WHERE name = 'Sunny Villa'), (SELECT user_id FROM User WHERE email = 'robel.johnson@example.com'), 5, 'Amazing experience, the villa was perfect!'),
  (UUID(), (SELECT property_id FROM Property WHERE name = 'Mountain Retreat'), (SELECT user_id FROM User WHERE email = 'robel.johnson@example.com'), 4, 'Great cabin, but the Wi-Fi could be better.');
-- Inserting messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
  (UUID(), (SELECT user_id FROM User WHERE email = 'alice.johnson@example.com'), (SELECT user_id FROM User WHERE email = 'bob.smith@example.com'), 'Hi Bob, I loved the Sunny Villa! Could you share more details about the amenities?'),
  (UUID(), (SELECT user_id FROM User WHERE email = 'bob.smith@example.com'), (SELECT user_id FROM User WHERE email = 'alice.johnson@example.com'), 'Hi Alice, I am glad you enjoyed your stay! Let me know if you have any questions.');
