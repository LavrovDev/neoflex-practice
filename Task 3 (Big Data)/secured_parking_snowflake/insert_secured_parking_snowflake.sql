-- Заполняем страны
INSERT INTO TABLE dim_country VALUES
(1, 'Russia', 4000000000000.00),
(2, 'Germany', 4500000000000.00),
(3, 'Japan', 5000000000000.00);

-- Заполняем города
INSERT INTO TABLE dim_city VALUES
(1, 1, 12500000),  -- Москва
(2, 1, 5350000),   -- Санкт-Петербург
(3, 2, 3600000),   -- Берлин
(4, 3, 13900000);  -- Токио

-- Заполняем районы
INSERT INTO TABLE dim_district VALUES
(1, 'Central'),
(2, 'Northern'),
(3, 'Southern'),
(4, 'Western'),
(5, 'Eastern');

-- Заполняем улицы
INSERT INTO TABLE dim_street VALUES
(1, 'Main Street', '1', 1, 1),
(2, 'Park Avenue', '25', 1, 1),
(3, 'Oak Street', '15', 2, 1),
(4, 'Lenina', '10', 1, 2),
(5, 'Nevsky Prospect', '50', 1, 2);

-- Заполняем типы парковочных мест
INSERT INTO TABLE dim_space_type VALUES
(1, 'Standard'),
(2, 'Premium'),
(3, 'Disabled'),
(4, 'Electric'),
(5, 'Family');

-- Заполняем парковки
INSERT INTO TABLE dim_parking VALUES
(1, 'Central Parking', '08:00:00', '22:00:00', 100),
(2, 'City Mall Parking', '07:00:00', '23:00:00', 200),
(3, 'Business Center Parking', '06:00:00', '20:00:00', 50);

-- Заполняем парковочные места
INSERT INTO TABLE dim_parking_spaces VALUES
(1, 101, false),
(2, 102, false),
(3, 103, true),
(4, 201, false),
(5, 202, true);

-- Связываем места с типами
INSERT INTO TABLE dim_space_parking VALUES
(1, 1), (2, 1), (3, 4), (4, 1), (5, 4);

-- Заполняем марки автомобилей
INSERT INTO TABLE dim_car_brand VALUES
(1, 'Toyota', '1937-08-28'),
(2, 'BMW', '1916-03-07'),
(3, 'Mercedes', '1926-06-28'),
(4, 'Lada', '1966-07-20');

-- Заполняем владельцев
INSERT INTO TABLE dim_owner VALUES
(1, 'Ivan', 'Ivanov', 'Ivanovich'),
(2, 'Petr', 'Petrov', 'Petrovich'),
(3, 'Maria', 'Sidorova', 'Alexandrovna');

-- Заполняем автомобили
INSERT INTO TABLE dim_car VALUES
(1, 'A123BC777', 'Camry', 1, 'Black'),
(2, 'B456DE888', 'X5', 2, 'White'),
(3, 'C789FG999', 'C-Class', 3, 'Silver'),
(4, 'D012HI111', 'Vesta', 4, 'Red');

-- Заполняем фактовую таблицу
INSERT INTO TABLE fact_parking_events VALUES
(1, 1, 1, 1, 1, '2024-01-15 08:30:00', '2024-01-15 17:45:00', 555, 1387.50),
(1, 2, 2, 2, 1, '2024-01-15 09:15:00', '2024-01-15 18:30:00', 555, 1387.50),
(2, 4, 3, 3, 2, '2024-01-15 10:00:00', '2024-01-15 16:00:00', 360, 900.00),
(1, 3, 4, 1, 1, '2024-01-16 14:20:00', '2024-01-16 16:40:00', 140, 350.00);