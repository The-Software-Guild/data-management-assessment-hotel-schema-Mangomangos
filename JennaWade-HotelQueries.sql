USE JennaWadeHotelDB;

-- 1. List of reservations that end in July 2023 (Guest Name, Room Number, Reservation Dates)
SELECT firstName, lastName, roomNumber, startDate, endDate
FROM reservation
INNER JOIN guest ON reservation.guestId = guest.guestId 
INNER JOIN room ON reservation.roomId = room.roomId
WHERE MONTH(endDate) = 7 AND YEAR(endDate) = 2023;

-- returned 4 results
/*
15	Jenna	    Wade	205	2023-06-28	2023-07-02
18	Bettyann	Seery	303	2023-07-28	2023-07-29
16	Walter	    Holaway	204	2023-07-13	2023-07-14
17	Wilfred	    Vise	401	2023-07-18	2023-07-21
*/


-- 2. List of reservations for rooms with a jacuzzi (Guest Name, Room Number, Reservation starting date)
SELECT reservationId, firstName, lastName, roomNumber, startDate
FROM reservation
INNER JOIN guest ON reservation.guestId = guest.guestId 
INNER JOIN roomAmenity ON reservation.roomId = roomAmenity.roomId
INNER JOIN room ON reservation.roomId = room.roomId
WHERE roomAmenity.amenityId = 2;

-- returned 8 results 
/*
4	Karie	    Yang	    201	2023-03-06
2	Bettyann	Seery	    203	2023-02-05
21	Karie	    Yang	    203	2023-09-13
15	Jenna	    Wade	    205	2023-06-28
10	Wilfred	    Vise	    207	2023-04-23
9	Walter	    Holaway	    301	2023-04-09
24	Mack	    Simmer	    301	2023-11-22
18	Bettyann	Seery	    303	2023-07-28
3	Duane	    Cullison	305	2023-02-22
19	Bettyann	Seery	    305	2023-08-30
5	Jenna	    Wade	    307	2023-03-17
*/

-- 3. Rooms reserved for specific guest (Guest Name, rooms, reservation starting date, total number of people in reservation)
SELECT firstName, lastName, roomNumber, startDate, endDate, SUM(numberOfAdults + numberOfChildren) totalPeople 
FROM reservation
INNER JOIN guest ON reservation.guestId = guest.guestId
INNER JOIN room ON reservation.roomId = room.roomId
WHERE firstName = "Mack" AND lastName = "Simmer"
GROUP BY firstName, lastName, roomNumber, startDate, endDate;

-- 4 rows returned 
/*
Mack Simmer 308 2023-02-02 2023-02-04 1
Mack Simmer 208 2023-09-16 2023-09-17 2
Mack Simmer 208 2023-11-22 2023-11-25 2
Mack Simmer 301 2023-11-22 2023-11-25 4
*/


-- 4. List of rooms (reservationId, per room cost of reservation)

SELECT roomNumber, reservationId, baseCost
FROM room 
LEFT OUTER JOIN reservation ON room.roomId = reservation.roomId
INNER JOIN roomType ON room.roomTypeId = roomType.roomTypeId;

-- returned 26 results 
/*
201	    4	    174.99
202	    7	    174.99
203	    2	    174.99
203	    21	    174.99
204	    16	    174.99
301	    9	    174.99
301	    24	    174.99
302	    6	    174.99
302	    25	    174.99
303	    18	    174.99
304	    14	    174.99
401	    11	    399.99
401	    17	    399.99
401	    22	    399.99
402	    NULL	399.99
205	    15	    149.99
206	    12	    149.99
206	    23	    149.99
207	    10	    149.99
208	    13	    149.99
208	    20	    149.99
305	    3	    149.99
305	    19	    149.99
306	    NULL	149.99
307 	5	    149.99
308	    1	    149.99
*/


-- 5. Rooms with capacity of 3 + reserved on any date in April 2023
SELECT roomNumber, reservationId, startDate, endDate
FROM room
INNER JOIN roomType ON room.roomTypeId = roomType.roomTypeId
INNER JOIN reservation ON room.roomId = reservation.roomId
WHERE room.roomTypeId < 3 AND 4 BETWEEN MONTH(startDate) AND MONTH(endDate);

-- returned 1 result
-- 301 9 2023-04-09 2023-04-13

-- 6. List of all guests (Names, number of reservations) -- ordered by number of reservation -- then ordered by guest last name
SELECT firstName, lastName, COUNT(reservationId) numberOfReservations
FROM guest
LEFT JOIN reservation ON guest.guestId = reservation.guestId
GROUP BY firstName, lastName
ORDER BY numberOfReservations DESC, lastName;

-- returned 14 results
/*

Mack	    Simmer	        4
Bettyann	Seery	        3
Duane	    Cullison	    2
Walter	    Holaway	        2
Aurore	    Lipton	        2
Maritza	    Tilton	        2
Joleen	    Tison	        2
Wilfred	    Vise	        2
Jenna	    Wade	        2
Karie	    Yang	        2
Zachery	    Luechtefeld	    1
*/


-- 7. Display name, address and phone number of guest based on phone number

SELECT firstName, lastName, guestAddress, guestCity, guestZip, guestPhone
FROM guest
WHERE guestPhone = "123-456-7890";

-- returned 1 result
-- Jenna Wade 123 Main Street Washington 20015 123-456-7890

