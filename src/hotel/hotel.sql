DROP TABLE HOTEL;
DROP TABLE GUEST;
DROP TABLE ROOM;
DROP TABLE BOOKING;

CREATE TABLE HOTEL (
    hotelNo INT NOT NULL,
    hotelName VARCHAR(20),
    city VARCHAR(20),
    primary key(hotelNo)
);

insert into HOTEL values (1, 'Death Inn', 'Seattle');
insert into HOTEL values (2, 'Life Inn', 'Chicago'); 
insert into HOTEL values (3, 'Earth Inn', 'Olympia'); 
insert into HOTEL values (4, 'World Inn', 'Bothell'); 
insert into HOTEL values (5, 'Ocean Inn', 'Columbus'); 
insert into HOTEL values (6, 'Hilton', 'Columbus'); 
insert into HOTEL values (7, 'Ocean', 'Las Vegas'); 
insert into HOTEL values (8, 'Ocean', 'Columbus'); 
insert into HOTEL values (9, 'Ocean2', 'Las Vegas'); 
insert into HOTEL values (10, 'Ocean3', 'Las Vegas'); 

CREATE TABLE ROOM (
    roomNo INT NOT NULL,
    H_hotelNo INT NOT NULL,
    roomType VARCHAR(10) DEFAULT 'Standard',
    price decimal(5,2) NOT NULL,
    primary key(roomNo, H_hotelNo),
    CONSTRAINT fkHotelNo FOREIGN key (H_hotelNo) References HOTEL (hotelNo),
    CONSTRAINT price_range CHECK (price BETWEEN 50.00 and 500.00),
    CONSTRAINT roomNo_range CHECK (roomNo BETWEEN 1 and 9999),
    CONSTRAINT roomTypes CHECK (roomType IN('Standard', 'Suite', 'Penthouse', 'Double', 'Single'))
);

-- Death Inn hotel rooms
insert into ROOM values (10, 1, 'Standard', 50.00);
insert into ROOM values (11, 1, 'Suite', 100.00);
insert into ROOM values (12, 1, 'Double', 75.00);

-- Ocean Hotel (Columbus) hotel rooms
insert into ROOM values (10, 8, 'Standard', 125.00);
insert into ROOM values (15, 8, 'Suite', 200.00);
insert into ROOM values (20, 8, 'Penthouse', 350.00);

CREATE TABLE GUEST (
    guestNo INT NOT NULL,
    guestName VARCHAR(20) NOT NULL,
    guestAddress VARCHAR(30),
    primary key(guestNo)
);

-- Guests
insert into GUEST values (1, 'Scarlett', 'Seattle');
insert into GUEST values (2, 'Cat', 'New York');

CREATE TABLE BOOKING (
    H_hotelNo INT NOT NULL,
    G_guestNo INT NOT NULL,
    dateFrom DATE NOT NULL,
    dateTo DATE NOT NULL,
    R_roomNo INT NOT NULL,
    primary key (H_hotelNo, G_guestNo, R_roomNo, dateFrom),
    foreign key(G_guestNo) References GUEST(guestNo),
    foreign key(R_roomNo, H_hotelNo) References ROOM(roomNo, H_hotelNo),
    CONSTRAINT dateOrder Check (dateFrom < dateTo)
);

-- Create Guest bookings, date format: month/day/year
insert into BOOKING values (8, 1, '12/10/2020', '23/10/2020', 20);
insert into BOOKING values (1, 2, '12/1/2021', '23/1/2021', 10);