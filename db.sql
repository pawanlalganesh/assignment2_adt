-- CREATE DATABASE car_service;

-- drop table and type in reverse order
DROP TABLE IF EXISTS payment;
DROP TABLE IF EXISTS trip;
DROP TABLE IF EXISTS car;
DROP TABLE IF EXISTS rider;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS users;

DROP TYPE IF EXISTS PaymentType;
DROP TYPE IF EXISTS Rating;
DROP TYPE IF EXISTS TripStatus;
DROP TYPE IF EXISTS Color;
DROP TYPE IF EXISTS Document;
DROP TYPE IF EXISTS Category;
DROP TYPE IF EXISTS Location;
DROP TYPE IF EXISTS Address;


CREATE TYPE Address AS (
    street VARCHAR(100),
    city VARCHAR(100),
    postal_code VARCHAR(10),
    country VARCHAR(60)
);

CREATE TYPE Category AS ENUM ('citizenship', 'license', 'passport', 'other');

CREATE TYPE Document AS (
    category Category,
    document_no VARCHAR(255),
    issued_on DATE,
    expires_on DATE
);

CREATE TYPE Location AS (
    latitude double precision,
    longitude double precision
);


CREATE TYPE Color AS ENUM ('red', 'green', 'blue', 'yellow', 'black', 'white', 'grey', 'purple', 'brown', 'orange', 'pink', 'silver', 'gold');

CREATE TYPE TripStatus AS ENUM ('requested', 'accepted', 'inprogress', 'cancelled', 'completed');

CREATE TYPE Rating AS ENUM ('1', '2', '3', '4', '5');

CREATE TYPE PaymentType AS ENUM ('online', 'cash', 'card');


-- base user table
CREATE TABLE users(
    name VARCHAR(100) NOT NULL,
    email VARCHAR(254) UNIQUE NOT NULL,
    phone_number VARCHAR(20) UNIQUE NOT NULL,
    password VARCHAR(254) NOT NULL,
    address Address[] NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

-- inherit rider from user table
CREATE TABLE rider (
    id serial PRIMARY KEY,
    is_verified BOOLEAN NOT NULL DEFAULT FALSE,
    document Document[] NOT NULL
) INHERITS (users);

-- insert data into rider table
INSERT INTO rider(name, email, phone_number, password, address, created_at, updated_at, is_verified, document)
VALUES
('Lucilia Sowray', 'lsowray0@bandcamp.com', '+86 559 706 3485', 'ZWYVIDd3W0', ARRAY[('0240 Larry Junction', 'Guaxupé', '37800', 'Brazil')]::Address[], NOW(), NOW(), false, ARRAY[('license', '7579376806', '2022/04/23', '2022/06/19')]::Document[]),
('Alvis Higford', 'ahigford1@behance.net', '+46 909 414 2567', 'qD0kt8W1sTI', ARRAY[('968 Bay Avenue', 'Barru', '99876', 'Indonesia'), ('03824 Truax Lane', 'Tongxing', null, 'China')]::Address[], NOW(), NOW(), true, ARRAY[('license', '8863596603', '2020/03/27', '2021/10/21')]::Document[]),
('Gaby D''Arrigo', 'gdarrigo2@bbb.org', '+852 697 441 5096', 'gkpjLICCNq', ARRAY[('50144 Prairieview Way', 'Antsirabe', '09876', 'Madagascar')]::Address[], NOW(), NOW(), false, ARRAY[('license', '3795739934', '2019/08/08', '2021/08/07')]::Document[]),
('Rheta Trewman', 'rtrewman3@yellowpages.com', '+47 144 578 1425', 'DYLSyGHE3', ARRAY[('8 Bartelt Crossing', 'Les Abymes', '97182', 'Guadeloupe')]::Address[], NOW(), NOW(), false, ARRAY[('license', '0636288730', '2019/12/25', '2022/05/10')]::Document[]),
('Hort Cadwallader', 'hcadwallader4@ibm.com', '+254 495 295 7406', 'YWJ2k8', ARRAY[('Obere Str. 57', 'Berlin', '12209', 'Germany')]::Address[], NOW(), NOW(), false, ARRAY[('license', '1610164601', '2021/07/27', '2021/09/15')]::Document[]),
('Juliet Itzhak', 'jitzhak5@tumblr.com', '+86 866 469 9224', 'I13wS8oCIBN', ARRAY[('805 Gulseth Circle', 'Karanggeneng', '45329', 'Indonesia')]::Address[], NOW(), NOW(), true, ARRAY[('license', '9721186619', '2020/10/07', '2021/09/02')]::Document[]),
('Gerardo Garnar', 'ggarnar6@google.it', '+62 272 486 2375', 'mjjeQy', ARRAY[('Obere Str. 57', 'Berlin', '12209', 'Germany')]::Address[], NOW(), NOW(), false, ARRAY[('license', '4443595244', '2021/07/14', '2022/04/18')]::Document[]),
('Mabel Rawdales', 'mrawdales7@imageshack.us', '+47 874 108 7793', 'B6lbfZv5nPEg', ARRAY[('089 Cherokee Way', 'Stírion', '47541', 'Greece')]::Address[], NOW(), NOW(), true, ARRAY[('license', '8343329236', '2021/10/01', '2022/01/10')]::Document[]),
('Simmonds Reding', 'sreding8@comcast.net', '+34 644 253 1371', 'eJBV8iAs', ARRAY[('Obere Str. 57', 'Berlin', '12209', 'Germany'), ('22 Messerschmidt Park', 'Huimin', null, 'China')]::Address[], NOW(), NOW(), true, ARRAY[('license', '4184470335', '2021/09/17', '2022/01/09')]::Document[]),
('Kennie Grimmett', 'kgrimmett9@bing.com', '+86 517 853 5063', '3qZgWw6YMBpk', ARRAY[('19 Northport Drive', 'Graz', '8042', 'Austria')]::Address[], NOW(), NOW(), false, ARRAY[('license', '2105942407', '2022/03/10', '2022/03/02')]::Document[]),
('Jo-ann Mollen', 'jmollena@canalblog.com', '+86 631 879 5309', 'e3pgI0s07Ycv', ARRAY[('6462 Declaration Circle', 'Pagsañgahan', '4324', 'Philippines')]::Address[], NOW(), NOW(), true, ARRAY[('license', '4877070796', '2021/07/28', '2022/03/04')]::Document[]),
('Carolee Deaconson', 'cdeaconsonb@upenn.edu', '+48 445 314 8675', 'K1Lb6YYcxJJx', ARRAY[('2208 Dawn Terrace', 'Arauca', '810009', 'Colombia'), ('8574 Del Mar Junction', 'Bandar ‘Abbās', null, 'Iran')]::Address[], NOW(), NOW(), true, ARRAY[('license', '8179719464', '2020/10/28', '2021/11/23')]::Document[]),
('Sallee Benbrick', 'sbenbrickc@blinklist.com', '+48 459 631 7325', 'bvvjNN', ARRAY[('Obere Str. 57', 'Berlin', '12209', 'Germany')]::Address[], NOW(), NOW(), false, ARRAY[('license', '3976402834', '2020/05/19', '2021/11/27')]::Document[]),
('Raquel Djuricic', 'rdjuricicd@wikia.com', '+86 319 745 1936', 'p76GgV9jTb', ARRAY[('55 Bartillon Circle', 'Cantuk Kidul', '8897', 'Indonesia'), ('70581 Waywood Trail', 'Seririt', null, 'Indonesia')]::Address[], NOW(), NOW(), false, ARRAY[('license', '1084700883', '2020/05/15', '2021/12/21')]::Document[]),
('Crysta Poundford', 'cpoundforde@reverbnation.com', '+63 393 178 7179', 'HxorEFb', ARRAY[('0240 Larry Junction', 'Guaxupé', '37800', 'Brazil')]::Address[], NOW(), NOW(), true, ARRAY[('license', '5503086066', '2021/10/14', '2022/06/07')]::Document[]);


-- inherit customer from user table
CREATE TABLE customer (
    id serial PRIMARY KEY,
    account_balance money DEFAULT 0
) INHERITS (users);

-- insert data into customer table
INSERT INTO customer(name, email, phone_number, password, address, created_at, updated_at, account_balance)
VALUES
('Loraine Giddings', 'lorainegiddings@gmail.com', '+1 (865) 581-9071', 'ZWYVIDd3W0', ARRAY[('0240 Larry Junction', 'Guaxupé', '37800', 'Brazil')]::Address[], NOW(), NOW(), '100.60'),
('Rudolpho Giddings', 'eudolphogiddings@hotmail.com', '+1 (865) 581-9071', 'ZWYVIDd3W0', ARRAY[('0240 Larry Junction', 'Guaxupé', '37800', 'Brazil')]::Address[], NOW(), NOW(), '1.60'),
('Marga Rendle', 'mrendle0@paginegialle.it', '+966 946 311 4053', 'IZSr8I8p', ARRAY[('181 Bobwhite Drive', 'Al Ulá', '9876', 'Saudi Arabia')]::Address[], NOW(), NOW(), '178.60'),
('Lonny Caile', 'lcaile1@ezinearticles.com', '+234 550 828 7192', 'xfZlUGbb', ARRAY[('081 Burrows Avenue', 'Aku', '4567', 'Nigeria')]::Address[], NOW(), NOW(), '908.13'),
('Lorry Dagleas', 'ldagleas2@4shared.com', '+66 324 700 9721', 'mslNVfCt6', ARRAY[('31 Raven Parkway', 'Ban Na Muang', '71150', 'Thailand')]::Address[], NOW(), NOW(), '6098.08'),
('Gabriel Barracks', 'gbarracks3@mapquest.com', '+51 395 978 9343', 's3usWSJ', ARRAY[('84 Hanson Trail', 'Olmos', '7459', 'Peru')]::Address[], NOW(), NOW(), '7980.92'),
('Meredith Maunsell', 'mmaunsell4@parallels.com', '+51 693 919 4241', 'ld7ZxaDu', ARRAY[('8 Anthes Center', 'Lahuaytambo', '4587', 'Peru')]::Address[], NOW(), NOW(), '89865.22'),
('Bartholomew Kirkby', 'bkirkby5@wiley.com', '+46 494 109 2829', '8FS8LKqx', ARRAY[('7458 Arapahoe Park', 'Mariefred', '64781', 'Sweden')]::Address[], NOW(), NOW(), '80.87'),
('Angelia Wimp', 'awimp6@miibeian.gov.cn', '+1 652 369 4726', 'uYgy3uZm', ARRAY[('7582 Schlimgen Street', 'Camlachie', '1487', 'Canada')]::Address[], NOW(), NOW(), '5.81'),
('Hilary Ockleshaw', 'hockleshaw7@imgur.com', '+370 172 699 4050', 'WzFlCO', ARRAY[('17 Hollow Ridge Pass', 'Vilkaviskis', '70073', 'Lithuania')]::Address[], NOW(), NOW(), '40.48'),
('Consolata Dowall', 'cdowall8@slashdot.org', '+63 550 381 4086', '2kCK82o9ixS', ARRAY[('21 Stephen Park', 'Angono', '1930', 'Philippines')]::Address[], NOW(), NOW(), '30.60'),
('Davey Danielian', 'ddanielian9@hibu.com', '+86 641 341 3703', 'ogKZOVGN', ARRAY[('5 Judy Trail', 'Botou', '7467', 'China')]::Address[], NOW(), NOW(), '578.38'),
('Beale Sharphurst', 'bsharphursta@timesonline.co.uk', '+234 129 451 4515', '6bkGbY7B', ARRAY[('6126 Mosinee Point', 'Bokani', '7123', 'Nigeria')]::Address[], NOW(), NOW(), '8678.01'),
('Jenine Shildrick', 'jshildrickb@mashable.com', '+966 858 808 4522', '6Qw7OpNr', ARRAY[('4262 Pawling Junction', 'Najrān', '98978', 'Saudi Arabia')]::Address[], NOW(), NOW(), '45678.51'),
('Constancia Wynne', 'cwynnec@timesonline.co.uk', '+86 673 843 6922', 'MBr4O64c', ARRAY[('502 Claremont Avenue', 'Xingfu', '76350', 'China')]::Address[], NOW(), NOW(), '64567.88');

-- create table for car

CREATE TABLE car(
    id serial PRIMARY KEY,
    rider_id INT,
    make VARCHAR(100) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INTEGER NOT NULL,
    license_plate_no VARCHAR(10) NOT NULL,
    color Color NOT NULL,
    base_rate money NOT NULL,

    CONSTRAINT fk_rider
        FOREIGN KEY(rider_id) 
	        REFERENCES rider(id)
            ON DELETE CASCADE
);

-- insert into car table


-- create table document

-- CREATE TABLE document(
--     id serial PRIMARY KEY,
--     rider_id INT,
--     category Category NOT NULL,
--     document_no VARCHAR(255) NOT NULL,
--     issued_on DATE NOT NULL,
--     expires_on DATE,
    
--     CONSTRAINT fk_rider
--         FOREIGN KEY(rider_id) 
-- 	        REFERENCES rider(id)
--             ON DELETE CASCADE
-- );

--insert into document table


-- create table for trip

CREATE TABLE trip(
    id serial PRIMARY KEY,
    rider_id INT,
    customer_id INT,
    requested_on TIMESTAMP NOT NULL,
    pickup_location Location NOT NULL,
    destination_location Location,
    wait_time TIMESTAMP,
    start_on TIMESTAMP,
    end_on TIMESTAMP,
    status TripStatus,
    customer_rating Rating,
    rider_rating Rating,
    
    CONSTRAINT fk_rider
        FOREIGN KEY(rider_id)
            REFERENCES rider(id)
            ON DELETE CASCADE,

    CONSTRAINT fk_customer
        FOREIGN KEY(customer_id)
            REFERENCES customer(id)
            ON DELETE CASCADE
);

--insert into trip table


-- create table for payment

CREATE TABLE payment (
    id serial PRIMARY KEY,
    trip_id INT,
    payment_date TIMESTAMP NOT NULL,
    type PaymentType NOT NULL,
    base_rate money NOT NULL,
    surge_rate money NOT NULL,
    tip_amount money NOT NULL,
    total money NOT NULL,

    CONSTRAINT fk_trip
        FOREIGN KEY(trip_id)
            REFERENCES trip(id)
            ON DELETE CASCADE
);


-- insert into payment table





