CREATE DATABASE secured_parking_lots_snowflake;

USE secured_parking_lots_star_snowflake;

CREATE TABLE IF NOT EXISTS fact_parking_events (
    parking_id INT,
    parking_space_id INT,
    car_id INT,
    owner_id INT,
    street_id INT,
    start_time TIMESTAMP,
    end_time TIMESTAMP
)
COMMENT 'Фактовая таблица событий парковки'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

CREATE TABLE IF NOT EXISTS dim_parking (
    parking_id INT,
    parking_name STRING,
    open_time STRING,
    close_time STRING,
    total_spaces INT
)
COMMENT 'Измерение парковок'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

CREATE TABLE IF NOT EXISTS dim_parking_spaces (
    parking_space_id INT,
    space_number INT,
    is_electric_charging BOOLEAN
)
COMMENT 'Измерение парковочных мест'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

CREATE TABLE IF NOT EXISTS dim_space_parking (
    parking_space_id INT,
    space_type_id INT
)
COMMENT 'Связь парковочных мест с типами'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

CREATE TABLE IF NOT EXISTS dim_space_type (
    space_type_id INT,
    space_type_name STRING
)
COMMENT 'Измерение типов парковочных мест'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

CREATE TABLE IF NOT EXISTS dim_street (
    street_id INT,
    street_name STRING,
    home_number STRING,
    district_id INT,
    city_id INT
)
COMMENT 'Измерение улиц'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

CREATE TABLE IF NOT EXISTS dim_district (
    district_id INT,
    district_name STRING
)
COMMENT 'Измерение районов'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

CREATE TABLE IF NOT EXISTS dim_city (
    city_id INT,
    country_id INT,
    population INT
)
COMMENT 'Измерение городов'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

CREATE TABLE IF NOT EXISTS dim_country (
    country_id INT,
    country_name STRING,
    income DECIMAL(15,2)
)
COMMENT 'Измерение стран'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

CREATE TABLE IF NOT EXISTS dim_owner (
    owner_id INT,
    name STRING,
    surname STRING,
    patronymic,
)
COMMENT 'Измерение владельцев автомобилей'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

CREATE TABLE IF NOT EXISTS dim_car (
    car_id INT,
    registration_number STRING,
    model STRING,
    car_brand_id INT,
    color STRING,
    year INT,
    insurance_number STRING
)
COMMENT 'Измерение автомобилей'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

CREATE TABLE IF NOT EXISTS dim_car_brand (
    car_brand_id INT,
    name_brand STRING,
    foundation_date DATE
)
COMMENT 'Измерение марок автомобилей'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;