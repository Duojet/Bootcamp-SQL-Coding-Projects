--DROP DATABASE libraryManagementDB;
--CREATE DATABASE libraryManagementDB;
USE libraryManagementDB



CREATE TABLE libraryBranch (
	branchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	branchName VARCHAR(30) NOT NULL,
	branchAddress VARCHAR(50) NOT NULL
);

CREATE TABLE publisher (
	publisherName VARCHAR(30) PRIMARY KEY NOT NULL,
	publisherAddress VARCHAR(50) NOT NULL,
	publisherPhone VARCHAR(30) NOT NULL
);

CREATE TABLE books (
	bookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	bookTitle VARCHAR(50) NOT NULL,
	publisherName VARCHAR(30) FOREIGN KEY REFERENCES publisher(publisherName) NOT NULL
);


CREATE TABLE bookAuthors (
	bookID INT FOREIGN KEY REFERENCES books(bookID) NOT NULL,
	authorName VARCHAR(30) NOT NULL
);


CREATE TABLE bookCopies (
	bookID INT FOREIGN KEY REFERENCES books(bookID) NOT NULL,
	branchID INT FOREIGN KEY REFERENCES libraryBranch(branchID) NOT NULL,
	NumberOfCopies INT NOT NULL 
);

CREATE TABLE borrower (
	cardNum VARCHAR(30) PRIMARY KEY NOT NULL,
	borrowerName VARCHAR(30) NOT NULL,
	borrowerAddress VARCHAR(50) NOT NULL,
	borrowerPhone VARCHAR(30) NOT NULL
);

CREATE TABLE bookLoans (
	bookID INT FOREIGN KEY REFERENCES books(bookID) NOT NULL,
	branchID INT FOREIGN KEY REFERENCES libraryBranch(branchID) NOT NULL,
	cardNum VARCHAR(30) FOREIGN KEY REFERENCES borrower(cardNum) NOT NULL, 
	dateOut DATE NOT NULL,
	dateDue DATE NOT NULL
);




INSERT INTO libraryBranch
	(branchName, branchAddress)
	VALUES
	('Sharpstown', '58 8th Ave Springfield, OR'),
	('Central', '420 Main St Springfield, OR'),
	('East', '7172 E Wyatt Blvd Springfield, OR'),
	('West', '2525 W Chump St Springfield, OR')
	;


INSERT INTO publisher
	(publisherName, publisherAddress, publisherPhone)
	VALUES
	('G.P. PUTNAMS SONS', '45 Lexington Ave New York, NY  10002', '454-555-5656'),
	('CELADON BOOKS', '5256 SE Floss Blve Albany, NY  10152', '789-456-6123'),
	('LAKE UNION PUBLISHING', '24 Hendrix Ave  Tacoma, WA  99856', '123-456-7893'),
	('POTTERMORE PUBLISHING', 'PO Box 7828, London W1A 4GE, UK', '+044 5556 542565'),
	('HARPER PAPERBACKS', '1018 W. Roosevelt St. Phoenix, AZ 85007', '480-275-4280'),
	('R.R. Banks', '145 West 7th Ave  Morpib, AD', '564-568-5685'),
	('CROOKED LANE BOOKS', '15454 East 10th Ave  Mongomery, AL 56565', '165-654-7896'),
	('PENGUIN BOOKS', '10 Scattershot Ln , Georgetown, VA 44866', '157-598-9876'),
	('THOMAS & MERCER', '4564 N 10th blvd Branson, MO  45662', '456-888-9969'),
	('MONTLAKE ROMANCE', '454 Fleet St. North Tombridge, SI  45689', '778-989-6547'),
	('WILLIAM MORROW', '4585 Iam Bored LN Town Center, MA  12302', '484-651-9876'),
	('HARPERIMPULSE', '5 Fortnight Row  Blantington, OL  12587', '789-965-3214'),
	('Henry Holt & Co', '258 Publisher St Goober, OH  45215', '546-654-5465')
	;



INSERT INTO books
	(bookTitle, publisherName)
	VALUES
	('Where the Crawdads Sing', 'G.P. PUTNAMS SONS'),
	('The Silent Patient', 'CELADON BOOKS'),
	('Where the Forest Meets the Stars', 'LAKE UNION PUBLISHING'),
	('Surprise Delivery','R.R. Banks'),
	('Harry Potter and the Sorcerer''s Stone', 'POTTERMORE PUBLISHING'),
	('What the Wind Knows', 'LAKE UNION PUBLISHING'),
	('The Coroner', 'CROOKED LANE BOOKS'),
	('Eleanor Oliphant Is Completely Fine', 'PENGUIN BOOKS'),
	('Beneath a Scarlet Sky', 'LAKE UNION PUBLISHING'),
	('The Rescue', 'THOMAS & MERCER'),
	('The Killer Collective', 'THOMAS & MERCER'),
	('The Beantown Girls' , 'LAKE UNION PUBLISHING'),
	('The Tattooist of Auschwitz', 'HARPER PAPERBACKS'),
	('Tumble', 'MONTLAKE ROMANCE'),
	('Edge of Eternity', 'PENGUIN BOOKS'),
	('The Perfect Child', 'THOMAS & MERCER'),
	('The Victory Garden', 'LAKE UNION PUBLISHING'),
	('The Lost Tribe', 'Henry Holt & Co'),
	('Christine', 'WILLIAM MORROW'),
	('The Dark Tower', 'HARPERIMPULSE')
	;


INSERT INTO bookAuthors
	(bookID,authorName)
	VALUES
	(1,'DELIA OWENS'),
	(2,'ALEX MICHAELIDES'),
	(3,'GLENDY VANDERAH'),
	(4,'R.R. BANKS'),
	(5,'J.K. ROWLING'),
	(6,'AMY HARMON'),
	(7,'JENNIFER GRAESER DORNBUSH'),
	(8,'GAIL HONEYMAN'),
	(9,'MARK SULLIVAN'),
	(10,'STEVEN KONKOLY'),
	(11,'BARRY EISLER'),
	(12,'JANE HEALEY'),
	(13,'HEATHER MORRIS'),
	(14,'ADRIANA LOCKE'),
	(15,'KEN FOLLETT'),
	(16,'LUCINDA BERRY'),
	(17,'RHYS BOWEN'),
	(18,'EDWARD MARRIOT'),
	(19,'STEPHEN KING'),
	(20,'STEPHEN KING')
	;




INSERT INTO borrower
	(cardNum, borrowerName, borrowerAddress, borrowerPhone)
	VALUES
	('123fay', 'My Name', '58117 St. Portand, OR  97214', '503-741-6920'),
	('123sdf', 'Joe Bob', '1234 SE Burbon St. Portand, OR  97951', '503-123-4567'),
	('123qwr', 'Jenny Todd', '1475 SE Tooms Rd. Portand, OR  97615', '503-123-8756'),
	('123asd', 'Bilbo Baggins', '1010 N Shire Ct. Portand, OR  97132', '503-258-9632'),
	('123fgh', 'Teddy Ruxpin', '123 SE Kissmybutt Rd. Portand, OR  97875', '503-741-8520'),
	('123sdg', 'Tony Toni', '156 SE Burbon St. Portand, OR  97951', '503-123-5267'),
	('123qwj', 'Gosh Golly', '1475 SE Bontomps Rd. Portand, OR  97315', '503-644-8756'),
	('123ask', 'Dude Stop', '1013 N Shire Ct. Portand, OR  97132', '503-258-6464'),
	('123fgl', 'Jaun Moore', '5858 117 St. Portand, OR  97214', '503-741-6920')
	;

INSERT INTO bookLoans
	(bookID, branchID, cardNum, dateOut, dateDue)
	VALUES
	(1, 1, '123sdf', '2019-12-12', '2020-01-12'),
	(16, 1, '123sdf', '2019-12-12', '2020-01-12'),
	(2, 3, '123qwr', '2019-5-12', '2019-6-12'),
	(5, 3, '123qwr', '2019-5-12', '2019-6-12'),
	(8, 3, '123qwr', '2019-5-12', '2019-6-12'),
	(10, 3,'123qwr', '2019-5-12', '2019-6-12'),  
	(11, 3, '123qwr', '2019-5-12', '2019-6-12'),
	(12, 3, '123qwr', '2019-5-12', '2019-6-12'),
	(14, 3, '123qwr', '2019-5-12', '2019-6-12'),
	(15, 3,'123qwr', '2019-5-12', '2019-6-12'),
	(4, 2, '123fgl', '2019-3-25', '2019-4-25'),
	(6, 2, '123fgl', '2019-3-25', '2019-4-25'),
	(8, 2, '123fgl', '2019-3-25', '2019-4-25'),
	(9, 2, '123fgl', '2019-3-26', '2019-4-26'),
	(11, 4, '123fgl', '2019-3-27', '2019-4-27'),
	(13, 4, '123fgl', '2019-3-27', '2019-4-27'),
	(20, 4, '123fgl', '2019-3-27', '2019-4-27'),
	(19, 2, '123fgl', '2019-4-15', '2019-5-15')
	;



INSERT INTO bookCopies
	(bookID, branchID, NumberOfCopies)
	VALUES
	(1, 1, 15),
	(1, 2, 13),
	(1, 3, 12),
	(1, 4, 5),
	(2, 1, 15),
	(2, 2, 13),
	(2, 3, 12),
	(2, 4, 5),
	(3, 1, 15),
	(3, 2, 13),
	(3, 3, 12),
	(3, 4, 5),
	(4, 1, 15),
	(4, 2, 13),
	(4, 3, 12),
	(4, 4, 5),
	(5, 1, 15),
	(5, 2, 13),
	(5, 3, 12),
	(5, 4, 5),
	(6, 1, 15),
	(6, 2, 13),
	(6, 3, 12),
	(6, 4, 5),
	(7, 1, 15),
	(7, 2, 13),
	(7, 3, 12),
	(7, 4, 5),
	(8, 1, 15),
	(8, 2, 13),
	(8, 3, 12),
	(8, 4, 5),
	(9, 1, 15),
	(9, 2, 13),
	(9, 3, 12),
	(9, 4, 5),
	(10, 1, 15),
	(10, 2, 13),
	(10, 3, 12),
	(10, 4, 5),
	(11, 1, 2),
	(11, 2, 2),
	(11, 3, 11),
	(11, 4, 5),
	(12, 1, 15),
	(13, 2, 13),
	(14, 3, 12),
	(14, 4, 5),
	(15, 1, 15),
	(15, 2, 13),
	(15, 3, 12),
	(15, 4, 5),
	(16, 1, 15),
	(16, 2, 13),
	(16, 3, 12),
	(16, 4, 5),
	(17, 1, 15),
	(17, 2, 13),
	(17, 3, 12),
	(17, 4, 5),
	(18, 1, 15),
	(18, 2, 13),
	(18, 3, 12),
	(18, 4, 5),
	(19, 1, 15),
	(19, 2, 13),
	(19, 3, 12),
	(19, 4, 5),
	(20, 1, 15),
	(20, 2, 13),
	(20, 3, 12),
	(20, 4, 5)
;

USE libraryManagementDB
--How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
GO
CREATE PROC dbo.uspCountLostTribe1
AS
SELECT  
	NumberOfCopies AS 'Number Of Copies', books.bookTitle AS 'Title', libraryBranch.branchName AS 'Branch Name'
	FROM bookCopies
	INNER JOIN books ON books.bookID = bookCopies.bookID
	INNER JOIN libraryBranch ON libraryBranch.branchID = bookCopies.branchID
	WHERE bookTitle = 'The Lost Tribe' AND branchName = 'sharpstown'
	;
GO

EXEC [dbo].[uspCountLostTribe1]

--How many copies of the book titled "The Lost Tribe" are owned by each library branch?	
GO
CREATE PROC dbo.uspCountLostTribeAll
AS
SELECT  
	NumberOfCopies AS 'Number Of Copies', books.bookTitle AS 'Title', libraryBranch.branchName AS 'Branch Name'
	FROM bookCopies
	INNER JOIN books ON books.bookID = bookCopies.bookID
	INNER JOIN libraryBranch ON libraryBranch.branchID = bookCopies.branchID
	WHERE bookTitle = 'The Lost Tribe'
	;
GO

EXEC [dbo].[uspCountLostTribeAll]

--Retrieve the names of all borrowers who do not have any books checked out.
GO
CREATE PROC dbo.uspInactiveBorrowers
AS
SELECT 
	borrowerName AS 'No Books Checked Out'
	FROM borrower 
	FULL OUTER JOIN bookLoans ON borrower.cardNum = bookLoans.cardNum
	WHERE bookLoans.cardNum IS NULL 
	;
GO

EXEC [dbo].[uspInactiveBorrowers]