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

CREATE TABLE  ROOM (
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

CREATE TABLE GUEST (
    guestNo INT NOT NULL,
    guestName VARCHAR(20) NOT NULL,
    guestAddress VARCHAR(30),
    primary key(guestNo)
);

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
