-- Парковки по районам
SELECT 
    d.District_name,
    COUNT(DISTINCT p.Parking_ID) as total_parkings,
    COUNT(ps.Parking_space_ID) as total_spaces
FROM District d
JOIN Parking p ON d.District_ID = p.District_ID
JOIN Parking_space ps ON p.Parking_ID = ps.Parking_ID
GROUP BY d.District_name
ORDER BY total_spaces DESC;

-- Парковки на конкретной улице
SELECT 
    p.Parking_ID,
    p.Open_time,
    ps.Parking_space_number
FROM Parking p
JOIN Street s ON p.Street_ID = s.Street_ID
JOIN Parking_space ps ON p.Parking_ID = ps.Parking_ID
WHERE s.Street_name = 'Main Street';

-- Автомобили конкретного владельца
SELECT 
    o.Owner_surname,
    o.Owner_name,
    cb.Car_brand_name,
    c.Car_registration_number
FROM Car c
JOIN Owner o ON c.Owner_ID = o.Owner_ID
JOIN Car_brand cb ON c.Car_brand_ID = cb.Car_brand_ID
WHERE o.Owner_surname = 'Ivanov';