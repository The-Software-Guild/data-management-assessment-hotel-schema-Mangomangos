
DROP DATABASE IF EXISTS JennaWadeHotelDB;
CREATE DATABASE JennaWadeHotelDB;
USE JennaWadeHotelDB;

DROP TABLE IF EXISTS amenity;
CREATE TABLE amenity (
    amenityId INT AUTO_INCREMENT,
    amenityType VARCHAR(25) NOT NULL,
    amenityCost DECIMAL(5,2) NOT NULL,
    CONSTRAINT pk_amenity
        PRIMARY KEY (amenityId)
);

DROP TABLE IF EXISTS roomType;
CREATE TABLE roomType (
    roomTypeId INT AUTO_INCREMENT,
    roomTypeName VARCHAR(15) NOT NULL,
    baseCost DECIMAL (8, 2),
    standardOccupancy INT NOT NULL,
    maxOccupancy INT NOT NULL,
    extraPersonFee DECIMAL (5,2),
    CONSTRAINT pk_roomType
        PRIMARY KEY (roomTypeId)
);

DROP TABLE IF EXISTS guest;
CREATE TABLE guest (
    guestId INT AUTO_INCREMENT,
    firstName VARCHAR (50) NOT NULL,
    lastName VARCHAR (50) NOT NULL, 
    guestAddress VARCHAR (100) NOT NULL,
    guestCity VARCHAR (25) NOT NULL,
    guestState VARCHAR (10) NOT NULL,
    guestZip VARCHAR (10) NOT NULL,
    guestPhone VARCHAR (15) NOT NULL,
    CONSTRAINT pk_guest
        PRIMARY KEY (guestId)
);

DROP TABLE IF EXISTS room;
CREATE TABLE room (
    roomId INT AUTO_INCREMENT,
    roomNumber INT NOT NULL,
    roomTypeId INT,
    adaAccessibility BIT NOT NULL,
    CONSTRAINT pk_room
        PRIMARY KEY (roomId),
    CONSTRAINT fk_room_roomType
        FOREIGN KEY (roomTypeId)
        REFERENCES roomType (roomTypeId)
);

DROP TABLE IF EXISTS reservation;
CREATE TABLE reservation (
    reservationId INT AUTO_INCREMENT,
    guestId INT,
    roomId INT,
    numberOfAdults INT NOT NULL,
    numberOfChildren INT NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL,
    totalCost DECIMAL (15,2) NOT NULL,
    CONSTRAINT pk_reservation
        PRIMARY KEY (reservationId),
    CONSTRAINT fk_reservation_guest
        FOREIGN KEY (guestId)
        REFERENCES guest (guestId),
    CONSTRAINT fk_reservation_room
        FOREIGN KEY (roomId)
        REFERENCES room (roomId)
);

DROP TABLE IF EXISTS roomAmenity;
CREATE TABLE roomAmenity (
    amenityId INT,
    roomId INT,
    CONSTRAINT pk_roomAmenity
        PRIMARY KEY (amenityId, roomId),
    CONSTRAINT fk_roomAmenity_amenity
        FOREIGN KEY (amenityId)
        REFERENCES amenity (amenityId),
    CONSTRAINT fk_roomAmenity_room
        FOREIGN KEY (roomId)
        REFERENCES room (roomId)    
);