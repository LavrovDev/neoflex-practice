CREATE DATABASE secured_parking_lots_data_vault;

USE secured_parking_lots_data_vault;

-- 1. ХАБЫ (Hubs) - Бизнес-ключи

CREATE TABLE IF NOT EXISTS hub_parking (
    parking_hash_key STRING COMMENT 'Хэш-ключ парковки',
    parking_id INT COMMENT 'Бизнес-ключ парковки',
    load_dts TIMESTAMP COMMENT 'Дата-время загрузки',
    record_source STRING COMMENT 'Источник данных'
)
COMMENT 'Хаб парковок - уникальные бизнес-ключи';


CREATE TABLE IF NOT EXISTS hub_car (
    car_hash_key STRING COMMENT 'Хэш-ключ автомобиля',
    car_id INT COMMENT 'Бизнес-ключ автомобиля',
    load_dts TIMESTAMP COMMENT 'Дата-время загрузки',
    record_source STRING COMMENT 'Источник данных'
)
COMMENT 'Хаб автомобилей - уникальные бизнес-ключи';

CREATE TABLE IF NOT EXISTS hub_owner (
    owner_hash_key STRING COMMENT 'Хэш-ключ владельца',
    owner_id INT COMMENT 'Бизнес-ключ владельца',
    load_dts TIMESTAMP COMMENT 'Дата-время загрузки',
    record_source STRING COMMENT 'Источник данных'
)
COMMENT 'Хаб владельцев - уникальные бизнес-ключи';

CREATE TABLE IF NOT EXISTS hub_parking_space (
    space_hash_key STRING COMMENT 'Хэш-ключ парковочного места',
    space_id INT COMMENT 'Бизнес-ключ парковочного места',
    load_dts TIMESTAMP COMMENT 'Дата-время загрузки',
    record_source STRING COMMENT 'Источник данных'
)
COMMENT 'Хаб парковочных мест - уникальные бизнес-ключи';

CREATE TABLE IF NOT EXISTS hub_street (
    street_hash_key STRING COMMENT 'Хэш-ключ улицы',
    street_id INT COMMENT 'Бизнес-ключ улицы',
    load_dts TIMESTAMP COMMENT 'Дата-время загрузки',
    record_source STRING COMMENT 'Источник данных'
)
COMMENT 'Хаб улиц - уникальные бизнес-ключи';

-- 2. САТТЕЛИТЫ (Satellites) - Атрибуты и история

CREATE TABLE IF NOT EXISTS sat_parking_details (
    parking_hash_key STRING COMMENT 'Ссылка на хаб парковки',
    load_dts TIMESTAMP COMMENT 'Дата-время загрузки',
    parking_name STRING COMMENT 'Название парковки',
    open_time STRING COMMENT 'Время открытия',
    close_time STRING COMMENT 'Время закрытия',
    total_spaces INT COMMENT 'Общее количество мест',
    record_source STRING COMMENT 'Источник данных'
)
COMMENT 'Саттелит деталей парковки - описательные атрибуты';

CREATE TABLE IF NOT EXISTS sat_parking_location (
    parking_hash_key STRING COMMENT 'Ссылка на хаб парковки',
    load_dts TIMESTAMP COMMENT 'Дата-время загрузки',
    address STRING COMMENT 'Адрес парковки',
    latitude DOUBLE COMMENT 'Широта',
    longitude DOUBLE COMMENT 'Долгота',
    record_source STRING COMMENT 'Источник данных'
)
COMMENT 'Саттелит местоположения парковки - географические атрибуты';

CREATE TABLE IF NOT EXISTS sat_car_details (
    car_hash_key STRING COMMENT 'Ссылка на хаб автомобиля',
    load_dts TIMESTAMP COMMENT 'Дата-время загрузки',
    model STRING COMMENT 'Модель автомобиля',
    color STRING COMMENT 'Цвет автомобиля',
    year INT COMMENT 'Год выпуска',
    record_source STRING COMMENT 'Источник данных'
)
COMMENT 'Саттелит деталей автомобиля - технические атрибуты';

CREATE TABLE IF NOT EXISTS sat_car_registration (
    car_hash_key STRING COMMENT 'Ссылка на хаб автомобиля',
    load_dts TIMESTAMP COMMENT 'Дата-время загрузки',
    registration_number STRING COMMENT 'Регистрационный номер',
    vin STRING COMMENT 'VIN номер',
    insurance_number STRING COMMENT 'Номер страховки',
    record_source STRING COMMENT 'Источник данных'
)
COMMENT 'Саттелит регистрации автомобиля - юридические атрибуты';

CREATE TABLE IF NOT EXISTS sat_owner_personal (
    owner_hash_key STRING COMMENT 'Ссылка на хаб владельца',
    load_dts TIMESTAMP COMMENT 'Дата-время загрузки',
    name STRING COMMENT 'Имя владельца',
    surname STRING COMMENT 'Фамилия владельца',
    patronymic STRING COMMENT 'Отчество владельца',
    record_source STRING COMMENT 'Источник данных'
)
COMMENT 'Саттелит персональных данных владельца';

CREATE TABLE IF NOT EXISTS sat_owner_contacts (
    owner_hash_key STRING COMMENT 'Ссылка на хаб владельца',
    load_dts TIMESTAMP COMMENT 'Дата-время загрузки',
    email STRING COMMENT 'Email адрес',
    phone STRING COMMENT 'Телефон',
    address STRING COMMENT 'Адрес проживания',
    record_source STRING COMMENT 'Источник данных'
)
COMMENT 'Саттелит контактных данных владельца';

CREATE TABLE IF NOT EXISTS sat_parking_space_details (
    space_hash_key STRING COMMENT 'Ссылка на хаб парковочного места',
    load_dts TIMESTAMP COMMENT 'Дата-время загрузки',
    space_number INT COMMENT 'Номер места',
    space_type STRING COMMENT 'Тип места',
    is_electric_charging BOOLEAN COMMENT 'Наличие электрической зарядки',
    record_source STRING COMMENT 'Источник данных'
)
COMMENT 'Саттелит деталей парковочного места';

CREATE TABLE IF NOT EXISTS sat_street_details (
    street_hash_key STRING COMMENT 'Ссылка на хаб улицы',
    load_dts TIMESTAMP COMMENT 'Дата-время загрузки',
    street_name STRING COMMENT 'Название улицы',
    district STRING COMMENT 'Район',
    city STRING COMMENT 'Город',
    record_source STRING COMMENT 'Источник данных'
)
COMMENT 'Саттелит деталей улицы';

-- 3. ЛИНКИ (Links) - Связи между хабами

CREATE TABLE IF NOT EXISTS link_car_owner (
    car_owner_hash_key STRING COMMENT 'Хэш-ключ связи автомобиль-владелец',
    car_hash_key STRING COMMENT 'Ссылка на хаб автомобиля',
    owner_hash_key STRING COMMENT 'Ссылка на хаб владельца',
    load_dts TIMESTAMP COMMENT 'Дата-время загрузки',
    record_source STRING COMMENT 'Источник данных'
)
COMMENT 'Линк связи автомобиль-владелец';

CREATE TABLE IF NOT EXISTS link_parking_space (
    parking_space_hash_key STRING COMMENT 'Хэш-ключ связи парковка-место',
    parking_hash_key STRING COMMENT 'Ссылка на хаб парковки',
    space_hash_key STRING COMMENT 'Ссылка на хаб парковочного места',
    load_dts TIMESTAMP COMMENT 'Дата-время загрузки',
    record_source STRING COMMENT 'Источник данных'
)
COMMENT 'Линк связи парковка-парковочное место';

CREATE TABLE IF NOT EXISTS link_parking_event (
    parking_event_hash_key STRING COMMENT 'Хэш-ключ события парковки',
    parking_hash_key STRING COMMENT 'Ссылка на хаб парковки',
    car_hash_key STRING COMMENT 'Ссылка на хаб автомобиля',
    space_hash_key STRING COMMENT 'Ссылка на хаб парковочного места',
    street_hash_key STRING COMMENT 'Ссылка на хаб улицы',
    load_dts TIMESTAMP COMMENT 'Дата-время загрузки',
    record_source STRING COMMENT 'Источник данных'
)
COMMENT 'Линк события парковки - фактовая таблица';

-- 4. САТТЕЛИТЫ ДЛЯ ЛИНКОВ - Атрибуты связей

CREATE TABLE IF NOT EXISTS sat_parking_event_details (
    parking_event_hash_key STRING COMMENT 'Ссылка на линк события парковки',
    load_dts TIMESTAMP COMMENT 'Дата-время загрузки',
    start_time TIMESTAMP COMMENT 'Время начала парковки',
    end_time TIMESTAMP COMMENT 'Время окончания парковки',
    duration_minutes INT COMMENT 'Длительность парковки в минутах',
    parking_fee DOUBLE COMMENT 'Стоимость парковки',
    payment_status STRING COMMENT 'Статус оплаты',
    record_source STRING COMMENT 'Источник данных'
)
COMMENT 'Саттелит деталей события парковки - фактовые атрибуты';

CREATE TABLE IF NOT EXISTS sat_car_ownership (
    car_owner_hash_key STRING COMMENT 'Ссылка на линк автомобиль-владелец',
    load_dts TIMESTAMP COMMENT 'Дата-время загрузки',
    ownership_start_date STRING COMMENT 'Дата начала владения',
    ownership_end_date STRING COMMENT 'Дата окончания владения',
    ownership_type STRING COMMENT 'Тип владения',
    record_source STRING COMMENT 'Источник данных'
)
COMMENT 'Саттелит владения автомобилем - атрибуты связи';