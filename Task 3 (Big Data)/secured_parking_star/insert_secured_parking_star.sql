-- Вставка данных в dim_street
INSERT INTO TABLE dim_street VALUES
(1, 'Main Street', 'Central', 'Moscow'),
(2, 'Park Avenue', 'Northern', 'Moscow'),
(3, 'Oak Street', 'Western', 'Moscow'),
(4, 'Lenina', 'Central', 'Saint Petersburg'),
(5, 'Nevsky Prospect', 'Central', 'Saint Petersburg');

-- Вставка данных в dim_parking
INSERT INTO TABLE dim_parking VALUES
(1, 'Central Parking', '08:00:00', '22:00:00', 50),
(2, 'City Mall Parking', '07:00:00', '23:00:00', 100),
(3, 'Business Center Parking', '06:00:00', '20:00:00', 30),
(4, 'Shopping Center Parking', '09:00:00', '21:00:00', 80),
(5, 'Residential Parking', '00:00:00', '23:59:59', 20);

-- Вставка данных в dim_parking_spaces
INSERT INTO TABLE dim_parking_spaces VALUES
(1, 101, 'Standard', false),
(2, 102, 'Standard', false),
(3, 103, 'Premium', true),
(4, 201, 'Standard', false),
(5, 202, 'Disabled', true),
(6, 301, 'Premium', true),
(7, 302, 'Standard', false),
(8, 401, 'Electric', true),
(9, 402, 'Standard', false),
(10, 501, 'Premium', true);

-- Вставка данных в dim_owner
INSERT INTO TABLE dim_owner VALUES
(1, 'Ivan', 'Ivanov', 'Ivanovich'),
(2, 'Petr', 'Petrov', 'Petrovich'),
(3, 'Maria', 'Sidorova', 'Alexandrovna'),
(4, 'Alexey', 'Smirnov', 'Sergeevich'),
(5, 'Elena', 'Kuznetsova', 'Vladimirovna');

-- Вставка данных в dim_car
INSERT INTO TABLE dim_car VALUES
(1, 'A123BC777', 'Camry', 'Toyota', 'Black'),
(2, 'B456DE888', 'Civic', 'Honda', 'White'),
(3, 'C789FG999', 'X5', 'BMW', 'Blue'),
(4, 'D012HI111', 'C-Class', 'Mercedes', 'Silver'),
(5, 'E345JK222', 'A6', 'Audi', 'Red'),
(6, 'F678LM333', 'Solaris', 'Hyundai', 'Green'),
(7, 'G901NO444', 'Logan', 'Renault', 'Gray');

-- Вставка данных в fact_parking_events
INSERT INTO TABLE fact_parking_events VALUES
(1, 1, 1, 1, 1, '2024-01-15 08:30:00', '2024-01-15 17:45:00'),
(1, 2, 2, 2, 1, '2024-01-15 09:15:00', '2024-01-15 18:30:00'),
(2, 4, 3, 3, 2, '2024-01-15 10:00:00', '2024-01-15 16:00:00'),
(2, 5, 4, 4, 2, '2024-01-15 08:45:00', '2024-01-15 19:30:00'),
(3, 6, 5, 5, 3, '2024-01-15 11:30:00', '2024-01-15 19:00:00'),
(1, 3, 6, 1, 1, '2024-01-15 14:20:00', '2024-01-15 16:40:00'),
(4, 8, 7, 2, 4, '2024-01-15 12:00:00', '2024-01-15 15:30:00'),
(1, 1, 3, 3, 1, '2024-01-16 09:00:00', '2024-01-16 18:00:00'),
(2, 4, 1, 1, 2, '2024-01-16 10:30:00', NULL);