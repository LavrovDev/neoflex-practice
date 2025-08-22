CREATE DATABASE secured_parking_lots_star;

USE secured_parking_lots_star;

- Фактовая таблица парковочных событий
CREATE TABLE IF NOT EXISTS fact_parking_events (
    parking_id INT,
    parking_space_id INT,
    car_id INT,
    owner_id INT,
    street_id INT,
    start_time TIMESTAMP,
    end_time TIMESTAMP
)
COMMENT 'Fact table for parking events with duration metrics'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

-- Измерение: Парковка
CREATE TABLE IF NOT EXISTS dim_parking (
    parking_id INT,
    parking_name STRING,
    open_time STRING,
    close_time STRING,
    total_spaces INT
)
COMMENT 'Parking dimension table'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

-- Измерение: Парковочные места
CREATE TABLE IF NOT EXISTS dim_parking_spaces (
    parking_space_id INT,
    space_number INT,
    space_type STRING,
    is_electric_charging BOOLEAN
)
COMMENT 'Parking spaces dimension table'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

-- Измерение: Улица
CREATE TABLE IF NOT EXISTS dim_street (
    street_id INT,
    name STRING,
    district STRING,
    city STRING
)
COMMENT 'Street dimension table'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

-- Измерение: Владелец
CREATE TABLE IF NOT EXISTS dim_owner (
    owner_id INT,
    name STRING,
    surname STRING,
    patronymic STRING
)
COMMENT 'Car owner dimension table'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

-- Измерение: Автомобиль
CREATE TABLE IF NOT EXISTS dim_car (
    car_id INT,
    registration_number STRING,
    model STRING,
    car_brand STRING,
    color STRING
)
COMMENT 'Car dimension table'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;