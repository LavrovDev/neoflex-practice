CREATE DATABASE secured_parking_lots;

USE secured_parking_lots;

CREATE TABLE Street (
    Street_ID INT,
    Street_name STRING
)
comment 'Dimension table for street details'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

CREATE TABLE District (
    District_ID INT,
    District_name STRING
)
comment 'Dimension table for district details'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

CREATE TABLE Owner (
    Owner_ID INT,
    Owner_surname STRING,
    Owner_name STRING,
    Owner_patronym STRING
)
comment 'Dimension table for owner details'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

CREATE TABLE Car_brand (
    Car_brand_ID INT,
    Car_brand_name STRING
)
comment 'Dimension table for car brand details'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

CREATE TABLE Parking (
    Parking_ID INT,
    Open_time STRING,
    Street_ID INT,
    District_ID INT
)
comment 'Dimension table for parking details'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

CREATE TABLE Parking_space (
    Parking_space_ID INT,
    Parking_ID INT,
    Parking_space_number INT
)
comment 'Dimension table for parking space details'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

CREATE TABLE Car (
    Car_ID INT,
    Owner_ID INT,
    Car_brand_ID INT,
    Car_registration_number STRING
)
comment 'Dimension table for car details'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;

CREATE TABLE Parking_time (
    Parking_time_ID INT,
    Parking_space_ID INT,
    Car_ID INT,
    Start_time TIMESTAMP,
    Departure_time TIMESTAMP
)
comment 'Fact table for parking time details'
row format delimited
fields terminated by ';'
lines terminated by '\n'
stored as textfile;