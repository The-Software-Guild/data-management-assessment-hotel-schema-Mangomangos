USE JennaWadeHotelDB;

INSERT INTO amenity
    VALUES
        ROW (1, "microwave", 0.00),
        ROW (2, "jacuzzi", 25.00),
        ROW (3, "refrigerator", 0.00),
        ROW (4, "oven", 0.00);

INSERT INTO guest
    VALUES
        ROW (1, "Jenna", "Wade", "123 Main Street", "Washington", "DC", "20015","123-456-7890"),
        ROW (2, "Mack", "Simmer", "379 Old Shore Street", "Council Bluffs", "IA", "51501", "291-553-0508"),
        ROW (3, "Bettyann", "Seery", "750 Wintergreen Dr.", "Wasilla", "AK", "99654", "478-277-9632"),
        ROW (4, "Duane", "Cullison", "9662 Foxrun Lane", "Harlingen", "TX", "78552", "308-494-0198"),
        ROW (5, "Karie", "Yang", "9378 W. Agusta Ave", "West Deptford", "NJ", "08096", "214-730-0298"),
        ROW (6, "Aurore", "Lipton", "762 Wild Rose Street", "Saginaw", "MI", "48601", "377-507-0974"),
        ROW (7, "Zachery", "Luechtefeld", "7, Polar Dr.", "Arvada", "CO", "80003", "814-485-2615"),
        ROW (8, "Jeremiah", "Pendergrass", "70 Oakwood St.", "Zion", "IL", "60099", "279-491-0960"),
        ROW (9, "Walter", "Holaway", "7556 Arrowhead St.", "Cumberland", "RI", "02864", "446-351-6860"),
        ROW (10, "Wilfred", "Vise", "77 West Surrey Street", "Oswego", "NY", "13126", "834-727-1001"),
        ROW (11, "Maritza", "Tilton", "939 Linda Rd.", "Burke", "VA", "22015", "446-351-6860"),
        ROW (12, "Joleen", "Tison", "87 Queen St.", "Drexel Hill", "PA", "19026", "231-893-2755");

INSERT INTO roomType (roomTypeName, baseCost, standardOccupancy, maxOccupancy, extraPersonFee)
    VALUES
        ROW ("Double", 174.99, 2, 4, 10.00),
        ROW ("Suite", 399.99, 3, 8, 20.00);

INSERT INTO roomType (roomTypeName, baseCost, standardOccupancy, maxOccupancy)
    VALUES ("Single", 149.99, 2, 2);

INSERT INTO room
    VALUES
        ROW (1, 201, 1, 0),
        ROW (2, 202, 1, 1),
        ROW (3, 203, 1, 0),
        ROW (4, 204, 1, 1),
        ROW (5, 205, 3, 0),
        ROW (6, 206, 3, 1),
        ROW (7, 207, 3, 0), 
        ROW (8, 208, 3, 1),
        ROW (9, 301, 1, 0),
        ROW (10, 302, 1, 1),
        ROW (11, 303, 1, 1),
        ROW (12, 304, 1, 1),
        ROW (13, 305, 3, 0),
        ROW (14, 306, 3, 1),
        ROW (15, 307, 3, 0),
        ROW (16, 308, 3, 1), 
        ROW (17, 401, 2, 1),
        ROW (18, 402, 2, 1);

INSERT INTO reservation (guestId, roomId, numberOfAdults, numberOfChildren, startDate, endDate, totalCost)
    VALUES
        ROW (2, 16, 1, 0, "2023-2-2", "2023-2-4", 299.98),
        ROW (3, 3, 2, 1, "2023-2-5", "2023-2-10", 999.95),
        ROW (4, 13, 2, 0, "2023-2-22", "2023-2-24", 349.98),
        ROW (5, 1, 2, 2, "2023-3-6", "2023-3-7", 199.99),
        ROW (1, 15, 1, 1, "2023-3-17", "2023-3-20", 524.97),
        ROW (6, 10, 3, 0, "2023-3-18", "2023-3-23", 924.95),
        ROW (7, 2, 2, 2, "2023-3-29", "2023-3-31", 349.98),
        ROW (8, 2, 2, 2, "2023-3-31", "2023-4-5", 874.95),
        ROW (9, 9, 1, 0, "2023-4-9", "2023-4-13", 799.96),
        ROW (10, 7, 1, 1, "2023-4-23", "2023-4-24", 174.99),
        ROW (11, 17, 2, 4, "2023-5-30", "2023-6-2", 1199.97),
        ROW (12, 6, 2, 0, "2023-6-10", "2023-6-14", 599.96),
        ROW (12, 8, 1, 0, "2023-6-10", "2023-6-14", 599.96),
        ROW (6, 12, 3, 0, "2023-6-17", "2023-6-18", 184.99),
        ROW (1, 5, 2, 0, "2023-6-28", "2023-7-2", 699.96),
        ROW (9, 4, 3, 1, "2023-7-13", "2023-7-14", 184.99),
        ROW (10, 17, 4, 2, "2023-7-18", "2023-7-21", 1259.97),
        ROW (3, 11, 2, 1, "2023-7-28", "2023-7-29", 199.99),
        ROW (3, 13, 1, 0, "2023-8-30", "2023-9-1", 349.98),
        ROW (2, 8, 2, 0, "2023-9-16", "2023-9-17", 149.99),
        ROW (5, 3, 2, 2, "2023-9-13", "2023-9-15", 399.98),
        ROW (4, 17, 2, 2, "2023-11-22", "2023-11-25", 599.97),
        ROW (2, 6, 2, 0, "2023-11-22", "2023-11-25", 449.97),
        ROW (2, 9, 2, 2, "2023-11-22", "2023-11-25", 599.97),
        ROW (11, 10, 2, 0, "2023-12-24", "2023-12-28", 699.96);



INSERT INTO roomAmenity (amenityId, roomId)
    VALUES
        ROW (1, 1),
        ROW (2, 1),
        ROW (3, 2),
        ROW (1, 3),
        ROW (2, 3),
        ROW (3, 4),
        ROW (1, 5),
        ROW (3,5),
        ROW (2,5),
        ROW (1, 6),
        ROW (3, 6),
        ROW (1, 7),
        ROW (3, 7),
        ROW (2, 7),
        ROW (1, 8),
        ROW (3, 8),
        ROW (1, 9),
        ROW (2, 9),
        ROW (3, 10),
        ROW (1, 11),
        ROW (2, 11),
        ROW (3, 12),
        ROW (1, 13),
        ROW (3, 13),
        ROW (2, 13),
        ROW (1, 14),
        ROW (3, 14),
        ROW (1, 15),
        ROW (3, 15),
        ROW (2, 15),
        ROW (1, 16),
        ROW (3, 16),
        ROW (1, 17),
        ROW (3, 17),
        ROW (4, 17),
        ROW (1, 18),
        ROW (3, 18),
        ROW (4, 18);


-- Removing Jeremiah Pendergrass from Database

-- Removing Jeremiah from resevations

DELETE FROM reservation
WHERE guestId = 8;

-- Removing Jeremiah from guest

DELETE FROM guest
WHERE guestId = 8;













        


