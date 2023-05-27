Create database little_lemon;

use little_lemon;

Create Table Customers(CustomerId int not null primary key, 
Fullname varchar(100) not null, 
PhoneNumber INT NOT NULL UNIQUE);

INSERT INTO Customers(CustomerId, FullName, PhoneNumber)
Values  (1, "Vanessa McCarthy", 0757536378),
 (2, "Marcos Romero", 0757536379),
 (3, "Hiroki Yamane", 0757536376), 
 (4, "Anna Iversen", 0757536375), 
 (5, "Diana Pinto", 0757536374);

CREATE TABLE Bookings (  
BookingID INT NOT NULL PRIMARY KEY,  
BookingDate DATE NOT NULL,  
TableNumber INT NOT NULL,   
NumberOfGuests INT NOT NULL CHECK ( NumberOfGuests <= 8),  
CustomerID INT NOT NULL,  
FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID) ON DELETE CASCADE ON UPDATE CASCADE   
); 

INSERT INTO Bookings (BookingID, BookingDate, TableNumber, NumberOfGuests,
CustomerID) Values (10, '2021-11-11', 7, 5, 1),
 (11, '2021-11-10', 5, 2, 2), 
 (12, '2021-11-10', 3, 2, 4);   
 
 -- Exercise 1 : Inner  Join
 SELECT FullName, PhoneNumber, b.BookingDate, b.NumberOfGuests
 FROM Customers as c
 INNER JOIN Bookings as b
 ON c.CustomerId = b.CustomerID;
 
-- Exercise 2 : LeftJoin
-- want to know which customer are booking 
Select c.CustomerId, b.BookingId
 FROM Customers as c
 LEFT JOIN Bookings as b
 ON c.CustomerId = b.CustomerID;
