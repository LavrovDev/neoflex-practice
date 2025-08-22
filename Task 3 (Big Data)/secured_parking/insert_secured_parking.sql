INSERT INTO TABLE Street VALUES
(1, 'Main Street'),
(2, 'Park Avenue'),
(3, 'Oak Street'),
(4, 'Maple Road'),
(5, 'Central Boulevard');

INSERT INTO TABLE District VALUES
(1, 'Downtown'),
(2, 'Uptown'),
(3, 'East Side'),
(4, 'West End'),
(5, 'Midtown');

INSERT INTO TABLE Owner VALUES
(1, 'Ivanov', 'Ivan', 'Ivanovich'),
(2, 'Petrov', 'Petr', 'Petrovich'),
(3, 'Sidorov', 'Alexey', 'Sergeevich'),
(4, 'Smirnov', 'Dmitry', NULL),
(5, 'Kuznetsov', 'Sergey', 'Vladimirovich');

INSERT INTO TABLE Car_brand VALUES
(1, 'Toyota'),
(2, 'Honda'),
(3, 'BMW'),
(4, 'Mercedes'),
(5, 'Audi');

INSERT INTO TABLE Parking VALUES
(1, '08:00:00', 1, 1),
(2, '07:30:00', 2, 2),
(3, '09:00:00', 3, 3),
(4, '08:30:00', 4, 4),
(5, '07:00:00', 5, 5);

INSERT INTO TABLE Parking_space VALUES
(1, 1, 101),
(2, 1, 102),
(3, 2, 201),
(4, 2, 202),
(5, 3, 301),
(6, 4, 401),
(7, 5, 501);

INSERT INTO TABLE Car VALUES
(1, 1, 1, 'A123BC777'),
(2, 2, 2, 'B456DE888'),
(3, 3, 3, 'C789FG999'),
(4, 4, 4, 'D012HI111'),
(5, 5, 5, 'E345JK222');

INSERT INTO TABLE Parking_time VALUES
(1, 1, 1, '2024-01-15 08:30:00', '2024-01-15 17:45:00'),
(2, 2, 2, '2024-01-15 09:15:00', '2024-01-15 18:30:00'),
(3, 3, 3, '2024-01-15 10:00:00', '2024-01-15 16:00:00'),
(4, 4, 4, '2024-01-15 08:45:00', NULL),
(5, 5, 5, '2024-01-15 11:30:00', '2024-01-15 19:00:00');