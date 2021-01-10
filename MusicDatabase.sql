/* Create database */
CREATE DATABASE MusicDatabase;
GO

/* Change to the Music database */
USE MusicDatabase;
GO


CREATE TABLE Customer (
    CustomerID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    CustomerName NVARCHAR(225) NOT NULL,


);

INSERT INTO Customer(CustomerName) VALUES ('Jane'), ('John'), ('Becky'),('Nikki'), ('Alex'), ('Mary'), ('Joshua'), ('Jack'),
    ('Bobby'), ('Louis'), ('Rick'), ('Billy'), ('Dill'), ('Shallon'), ('Johnny'), ('Alastor'), ('Bree'), ('Joe'), ('Jim');


CREATE TABLE MusicOrder(
    OrderID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    OrderDate NVARCHAR (225) NOT NULL,
    CustomerID INT NOT NULL,

    FOREIGN KEY (CustomerID) REFERENCES dbo.Customer(CustomerID),	
	
    
);


INSERT INTO MusicOrder(OrderDate, CustomerID) VALUES
			('December 20th', (SELECT CustomerID FROM Customer WHERE CustomerName = 'Jane')),
			('January 22nd' , (SELECT CustomerID FROM Customer WHERE CustomerName = 'John')),
			('May 5th', (SELECT CustomerID FROM Customer WHERE CustomerName = 'Becky')),
			('April 12th',(SELECT CustomerID FROM Customer WHERE CustomerName = 'Nikki')),
			('September 2nd',(SELECT CustomerID FROM Customer WHERE CustomerName = 'Alex')),
			('February 6th', (SELECT CustomerID FROM Customer WHERE CustomerName = 'Mary')),
			('July 5th', (SELECT CustomerID FROM Customer WHERE CustomerName = 'Joshua')),
			('June 10th' , (SELECT CustomerID FROM Customer WHERE CustomerName = 'Jack')),
			('August 22nd', (SELECT CustomerID FROM Customer WHERE CustomerName = 'Bobby')),
			('December 3rd',(SELECT CustomerID FROM Customer WHERE CustomerName = 'Louis')),
			('October 5th' ,(SELECT CustomerID FROM Customer WHERE CustomerName = 'Rick')),
			('March 4th', (SELECT CustomerID FROM Customer WHERE CustomerName = 'Billy')),
			('May 7th' , (SELECT CustomerID FROM Customer WHERE CustomerName = 'Dill')),
			('December 5th', (SELECT CustomerID FROM Customer WHERE CustomerName = 'Shallon')),
			('August 10th' , (SELECT CustomerID FROM Customer WHERE CustomerName = 'Johnny')),
			('April 10th' , (SELECT CustomerID FROM Customer WHERE CustomerName = 'Alastor')),
			('September 8th', (SELECT CustomerID FROM Customer WHERE CustomerName = 'Bree')),
			('April 20th' , (SELECT CustomerID FROM Customer WHERE CustomerName = 'Joe')),
			('July 18th' , (SELECT CustomerID FROM Customer WHERE CustomerName = 'Jim'))

	
	
			

CREATE TABLE Payment(
    PaymentID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    CreditNumber int NOT NULL,

);

INSERT INTO Payment(CreditNumber) VALUES ('1270'), ('3896'), ('8600'), ('7800'), ('3390'), ('4290'), 
('1990'), ('3990'), ('1000'), ('4577'), ('0500'), ('2220'), ('8910'), ('7470'), ('0000'),
('3870'), ('2750'), ('0080'), ('2223'), ('3344');



CREATE TABLE CustomerNumber(
     PhoneNumberID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
     CustomerID INT NOT NULL,
     PhoneNumber NVARCHAR(255) NOT NULL,


    FOREIGN KEY (CustomerID) REFERENCES dbo.Customer (CustomerID),


);

INSERT INTO CustomerNumber(PhoneNumber, CustomerID) VALUES
			('(444)450-2333', (SELECT CustomerID FROM Customer WHERE CustomerName = 'Jane')),
			('(504)320-9128', (SELECT CustomerID FROM Customer WHERE CustomerName = 'John')),
			('(106)202-5844',(SELECT CustomerID FROM Customer WHERE CustomerName = 'Becky')),
			('(839)158-8635', (SELECT CustomerID FROM Customer WHERE CustomerName = 'Nikki')),
			('(647)449-2733',(SELECT CustomerID FROM Customer WHERE CustomerName = 'Alex')),
			('(681)989-6572', (SELECT CustomerID FROM Customer WHERE CustomerName = 'Mary')),
			('(522)291-6496',(SELECT CustomerID FROM Customer WHERE CustomerName = 'Joshua')),
			('(815)944-3709', (SELECT CustomerID FROM Customer WHERE CustomerName = 'Jack')),
			('(222)813-1470',(SELECT CustomerID FROM Customer WHERE CustomerName = 'Bobby')),
			('(834)423-3794',(SELECT CustomerID FROM Customer WHERE CustomerName = 'Louis')),
			('(874)695-7414',(SELECT CustomerID FROM Customer WHERE CustomerName = 'Rick')),
			('(619)125-3691',(SELECT CustomerID FROM Customer WHERE CustomerName = 'Billy')),
			('(760)606-6827',(SELECT CustomerID FROM Customer WHERE CustomerName = 'Dill')),
			('(768)225-7626', (SELECT CustomerID FROM Customer WHERE CustomerName = 'Shallon')),
			('(657)395-3680', (SELECT CustomerID FROM Customer WHERE CustomerName = 'Johnny')),
			('(248)639-7131',(SELECT CustomerID FROM Customer WHERE CustomerName = 'Alastor')),
			('(952)588-0100' ,(SELECT CustomerID FROM Customer WHERE CustomerName = 'Bree')),
			('(912)583-0001' ,(SELECT CustomerID FROM Customer WHERE CustomerName = 'Joe')),
			('(876)223-2000' ,(SELECT CustomerID FROM Customer WHERE CustomerName = 'Jim'))
			




CREATE TABLE Shipping(
    ShippingID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	ShippingDay NVARCHAR (225) NOT NULL,
    CustomerID INT NOT NULL,
    PaymentID INT NOT NULL,
    PhoneNumberID INT NOT NULL,
    OrderID INT NOT NULL,

    
    FOREIGN KEY (CustomerID) REFERENCES dbo.Customer(CustomerID),

    FOREIGN KEY(OrderID) REFERENCES dbo.MusicOrder(OrderID),

    FOREIGN KEY(PaymentID) REFERENCES dbo.Payment(PaymentID),

	FOREIGN KEY (PhoneNumberID) REFERENCES dbo.CustomerNumber(PhoneNumberID),

);



INSERT INTO Shipping(ShippingDay, CustomerID, OrderID, PaymentID, PhoneNumberID) VALUES
			('Monday',(SELECT CustomerID FROM Customer WHERE CustomerName = 'Jane'), (SELECT OrderID FROM MusicOrder WHERE OrderDate = 'December 20th'),(SELECT PaymentID FROM Payment WHERE CreditNumber = '1270'),(SELECT PhoneNumberID FROM CustomerNumber WHERE PhoneNumber = '(444)450-2333')),
			('Tuesday', (SELECT CustomerID FROM Customer WHERE CustomerName = 'John'), (SELECT OrderID FROM MusicOrder WHERE OrderDate = 'January 22nd'),(SELECT PaymentID FROM Payment WHERE CreditNumber = '3896'),(SELECT PhoneNumberID FROM CustomerNumber WHERE PhoneNumber = '(504)320-9128')),
			('Wednesday',(SELECT CustomerID FROM Customer WHERE CustomerName = 'Becky'), (SELECT OrderID FROM MusicOrder WHERE OrderDate = 'May 5th'),(SELECT PaymentID FROM Payment WHERE CreditNumber = '8600'),(SELECT PhoneNumberID FROM CustomerNumber WHERE PhoneNumber = '(106)202-5844')),
			('Thursday' ,(SELECT CustomerID FROM Customer WHERE CustomerName = 'Nikki'),(SELECT OrderID FROM MusicOrder WHERE OrderDate = 'April 12th'),(SELECT PaymentID FROM Payment WHERE CreditNumber = '7800'),(SELECT PhoneNumberID FROM CustomerNumber WHERE PhoneNumber = '(839)158-8635')),
			('Friday', (SELECT CustomerID FROM Customer WHERE CustomerName = 'Alex'), (SELECT OrderID FROM MusicOrder WHERE OrderDate = 'September 2nd'),(SELECT PaymentID FROM Payment WHERE CreditNumber = '3390'),(SELECT PhoneNumberID FROM CustomerNumber WHERE PhoneNumber = '(647)449-2733')),
			('Sunday', (SELECT CustomerID FROM Customer WHERE CustomerName = 'Mary'),(SELECT OrderID FROM MusicOrder WHERE OrderDate = 'February 6th'),(SELECT PaymentID FROM Payment WHERE CreditNumber = '4290'),(SELECT PhoneNumberID FROM CustomerNumber WHERE PhoneNumber = '(681)989-6572')),
			('Monday',(SELECT CustomerID FROM Customer WHERE CustomerName = 'Joshua'),(SELECT OrderID FROM MusicOrder WHERE OrderDate = 'July 5th'),(SELECT PaymentID FROM Payment WHERE CreditNumber = '1990'),(SELECT PhoneNumberID FROM CustomerNumber WHERE PhoneNumber = '(522)291-6496')),
			('Tuesday',(SELECT CustomerID FROM Customer WHERE CustomerName = 'Jack'),(SELECT OrderID FROM MusicOrder WHERE OrderDate = 'June 10th'),(SELECT PaymentID FROM Payment WHERE CreditNumber = '3990'),(SELECT PhoneNumberID FROM CustomerNumber WHERE PhoneNumber = '(815)944-3709')),
			('Wednesday',(SELECT CustomerID FROM Customer WHERE CustomerName = 'Bobby'),(SELECT OrderID FROM MusicOrder WHERE OrderDate = 'August 22nd'),(SELECT PaymentID FROM Payment WHERE CreditNumber = '1000'),(SELECT PhoneNumberID FROM CustomerNumber WHERE PhoneNumber = '(222)813-1470')),
			('Thursday' ,(SELECT CustomerID FROM Customer WHERE CustomerName = 'Louis'),(SELECT OrderID FROM MusicOrder WHERE OrderDate = 'December 3rd'),(SELECT PaymentID FROM Payment WHERE CreditNumber = '4577'),(SELECT PhoneNumberID FROM CustomerNumber WHERE PhoneNumber = '(834)423-3794')),
			('Saturday', (SELECT CustomerID FROM Customer WHERE CustomerName = 'Rick'),(SELECT OrderID FROM MusicOrder WHERE OrderDate = 'October 5th'),(SELECT PaymentID FROM Payment WHERE CreditNumber = '2220'), (SELECT PhoneNumberID FROM CustomerNumber WHERE PhoneNumber = '(874)695-7414')),
			('Sunday', (SELECT CustomerID FROM Customer WHERE CustomerName = 'Billy'),(SELECT OrderID FROM MusicOrder WHERE OrderDate = 'March 4th'),(SELECT PaymentID FROM Payment WHERE CreditNumber = '8910'),(SELECT PhoneNumberID FROM CustomerNumber WHERE PhoneNumber = '(619)125-3691')),
			('Monday',(SELECT CustomerID FROM Customer WHERE CustomerName = 'Dill'),(SELECT OrderID FROM MusicOrder WHERE OrderDate = 'May 7th'),(SELECT PaymentID FROM Payment WHERE CreditNumber = '7470'),(SELECT PhoneNumberID FROM CustomerNumber WHERE PhoneNumber = '(760)606-6827')),
			('Tuesday', (SELECT CustomerID FROM Customer WHERE CustomerName = 'Shallon'),(SELECT OrderID FROM MusicOrder WHERE OrderDate = 'December 5th'),(SELECT PaymentID FROM Payment WHERE CreditNumber = '0000'),(SELECT PhoneNumberID FROM CustomerNumber WHERE PhoneNumber = '(768)225-7626')),
			('Wednesday',(SELECT CustomerID FROM Customer WHERE CustomerName = 'Johnny'),(SELECT OrderID FROM MusicOrder WHERE OrderDate = 'August 10th'),(SELECT PaymentID FROM Payment WHERE CreditNumber = '3870'),(SELECT PhoneNumberID FROM CustomerNumber WHERE PhoneNumber = '(657)395-3680')),
			('Thursday' ,(SELECT CustomerID FROM Customer WHERE CustomerName = 'Alastor'),(SELECT OrderID FROM MusicOrder WHERE OrderDate = 'April 10th'),(SELECT PaymentID FROM Payment WHERE CreditNumber = '2750'),(SELECT PhoneNumberID FROM CustomerNumber WHERE PhoneNumber = '(248)639-7131')),
			('Friday', (SELECT CustomerID FROM Customer WHERE CustomerName = 'Bree'),(SELECT OrderID FROM MusicOrder WHERE OrderDate = 'September 8th'),(SELECT PaymentID FROM Payment WHERE CreditNumber = '0080'),(SELECT PhoneNumberID FROM CustomerNumber WHERE PhoneNumber = '(952)588-0100')),
			('Saturday', (SELECT CustomerID FROM Customer WHERE CustomerName = 'Joe'),(SELECT OrderID FROM MusicOrder WHERE OrderDate = 'April 20th'),(SELECT PaymentID FROM Payment WHERE CreditNumber = '2223'),(SELECT PhoneNumberID FROM CustomerNumber WHERE PhoneNumber = '(912)583-0001')),
			('Sunday', (SELECT CustomerID FROM Customer WHERE CustomerName = 'Jim'),(SELECT OrderID FROM MusicOrder WHERE OrderDate = 'July 18th'),(SELECT PaymentID FROM Payment WHERE CreditNumber = '3344'),(SELECT PhoneNumberID FROM CustomerNumber WHERE PhoneNumber = '(876)223-2000'))
	


CREATE TABLE CustomersAddress (
  AddressID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  CustomerID INT NOT NULL,
  OrderID INT NOT NULL,
  ShippingID INT NOT NULL,

    FOREIGN KEY (CustomerID) REFERENCES dbo.Customer(CustomerID),

    FOREIGN KEY (ShippingID) REFERENCES dbo.Shipping(ShippingID),

    FOREIGN KEY (OrderID) REFERENCES dbo.MusicOrder(OrderID),

 );

 INSERT INTO CustomersAddress(CustomerID, ShippingID, OrderID) VALUES
	 		((SELECT CustomerID FROM Customer Where CustomerName = 'Jane'),(SELECT ShippingID FROM Shipping WHERE CustomerID = '1'), (SELECT OrderID FROM MusicOrder WHERE OrderDate = 'December 20th')),
			((SELECT CustomerID FROM Customer Where CustomerName ='John'),(SELECT ShippingID FROM Shipping WHERE CustomerID = '2'), (SELECT OrderID FROM MusicOrder WHERE OrderDate = 'January 22nd')),
			((SELECT CustomerID FROM Customer Where CustomerName ='Becky'),(SELECT ShippingID FROM Shipping WHERE CustomerID = '3'), (SELECT OrderID FROM MusicOrder WHERE OrderDate = 'May 5th')),
			((SELECT CustomerID FROM Customer Where CustomerName ='Nikki'),(SELECT ShippingID FROM Shipping WHERE CustomerID = '4'), (SELECT OrderID FROM MusicOrder WHERE OrderDate = 'April 12th')),
			((SELECT CustomerID FROM Customer Where CustomerName ='Alex'),(SELECT ShippingID FROM Shipping WHERE CustomerID = '5'), (SELECT OrderID FROM MusicOrder WHERE OrderDate = 'September 2nd')),
			((SELECT CustomerID FROM Customer Where CustomerName ='Mary'),(SELECT ShippingID FROM Shipping WHERE CustomerID = '6'), (SELECT OrderID FROM MusicOrder WHERE OrderDate = 'February 6th')),
			((SELECT CustomerID FROM Customer Where CustomerName ='Joshua'),(SELECT ShippingID FROM Shipping WHERE CustomerID = '7'), (SELECT OrderID FROM MusicOrder WHERE OrderDate = 'July 5th')),
			((SELECT CustomerID FROM Customer Where CustomerName ='Jack'),(SELECT ShippingID FROM Shipping WHERE CustomerID = '8'), (SELECT OrderID FROM MusicOrder WHERE OrderDate = 'June 10th')),
			((SELECT CustomerID FROM Customer Where CustomerName ='Bobby'),(SELECT ShippingID FROM Shipping WHERE CustomerID = '9'), (SELECT OrderID FROM MusicOrder WHERE OrderDate = 'August 22nd')),
			((SELECT CustomerID FROM Customer Where CustomerName ='Louis'),(SELECT ShippingID FROM Shipping WHERE CustomerID = '10'), (SELECT OrderID FROM MusicOrder WHERE OrderDate = 'December 3rd')),
			((SELECT CustomerID FROM Customer Where CustomerName ='Rick'),(SELECT ShippingID FROM Shipping WHERE CustomerID = '11'), (SELECT OrderID FROM MusicOrder WHERE OrderDate = 'October 5th')),
			((SELECT CustomerID FROM Customer Where CustomerName ='Billy'),(SELECT ShippingID FROM Shipping WHERE CustomerID = '12'), (SELECT OrderID FROM MusicOrder WHERE OrderDate = 'March 4th')),
			((SELECT CustomerID FROM Customer Where CustomerName ='Dill'),(SELECT ShippingID FROM Shipping WHERE CustomerID = '13'), (SELECT OrderID FROM MusicOrder WHERE OrderDate = 'May 7th')),
			((SELECT CustomerID FROM Customer Where CustomerName ='Shallon'),(SELECT ShippingID FROM Shipping WHERE CustomerID = '14'), (SELECT OrderID FROM MusicOrder WHERE OrderDate = 'December 5th')),
			((SELECT CustomerID FROM Customer Where CustomerName ='Johnny'),(SELECT ShippingID FROM Shipping WHERE CustomerID = '15'), (SELECT OrderID FROM MusicOrder WHERE OrderDate = 'August 10th')),
			((SELECT CustomerID FROM Customer Where CustomerName ='Alastor'),(SELECT ShippingID FROM Shipping WHERE CustomerID = '16'), (SELECT OrderID FROM MusicOrder WHERE OrderDate = 'April 10th')),
			((SELECT CustomerID FROM Customer Where CustomerName ='Bree'),(SELECT ShippingID FROM Shipping WHERE CustomerID = '17'), (SELECT OrderID FROM MusicOrder WHERE OrderDate = 'September 8th')),
			((SELECT CustomerID FROM Customer Where CustomerName ='Jim'),(SELECT ShippingID FROM Shipping WHERE CustomerID = '18'), (SELECT OrderID FROM MusicOrder WHERE OrderDate = 'April 20th')),
			((SELECT CustomerID FROM Customer Where CustomerName ='Joe'),(SELECT ShippingID FROM Shipping WHERE CustomerID = '19'), (SELECT OrderID FROM MusicOrder WHERE OrderDate = 'July 18th'))
			
	


CREATE TABLE Artists (
    ArtistID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    ArtistName nvarchar(255) NOT NULL,




);
INSERT INTO Artists(ArtistName) VALUES ('Lady Gaga'), ('KAMIJO'), ('Cardi B'), ('Seven Lions'), ('Steve Aoki'), ('Illenium'), ('Tiesto'), ('Britney Spears'), ('Unlike Pluto'), ('Stonebank'),
('Hiroyuki Sawano'), ('Aaron Smith'), ('Edward Maya'), ('Kalafina'), ('Archive'), ('JESSI'), ('Refused'), ('MitiS'), ('ProleteR');




/* Create tables */
CREATE TABLE MusicCompany (
    MusicCompanyID INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
	MusicCompanyName NVARCHAR (225) NOT NULL,

 
);

INSERT INTO MusicCompany(MusicCompanyName) VALUES ('Interscope'), ('Chateau Agency'), ('AOMG'), ('Interscope International'), ('JYP'), ('Sony Records'), ('DOTCOM'), ('Monstercat'), ('Acapella Records'), ('AFM Records'), ('BBC Records'), ('Cherry Tree Records'), ('Spinnin Records'), ('Spinnin Deep'), ('CloudKid'), ('NoCopyrightSounds'), ('Atlantic Records'), ('Kitsune Music'), ('GMM Grammys'), ('Beatmaker');

CREATE TABLE Songs (
	SongID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    SongName NVARCHAR(255),
    
);

INSERT INTO Songs(SongName) VALUES ('Heart'), ('Takeaway'), ('Poker Face'), ('WAP'), ('aLIEz'), ('Gucci'), ('Prism'), ('Fractals'), ('What Lana Says'), ('Knock You Out'), ('Searching for You'),
('Dancin [Krono Remix]'), ('Chippin In'), ('Bullets'), ('Heavenly Blue'), ('Rock you In'), ('Last of Me'), ('Stereo Love'), ('Coming on Strong');




CREATE TABLE MusicCompanyArtist( 
    MusicCompanyArtistID INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
    ArtistID INT NOT NULL,
    MusicCompanyID INT NOT NULL,


    FOREIGN KEY (ArtistID) REFERENCES dbo.Artists(ArtistID),

    FOREIGN KEY (MusicCompanyID) REFERENCES dbo.MusicCompany(MusicCompanyID),
   
);

INSERT INTO MusicCompanyArtist(ArtistID, MusicCompanyID) VALUES 
			(1, (SELECT MusicCompanyID FROM MusicCompany WHERE MusicCompanyName = 'Interscope')),
			(2, (SELECT MusicCompanyID FROM MusicCompany WHERE MusicCompanyName = 'Chateau Agency')),
			(3, (SELECT MusicCompanyID FROM MusicCompany WHERE MusicCompanyName = 'Atlantic Records')),
			(4, (SELECT MusicCompanyID FROM MusicCompany WHERE MusicCompanyName = 'BBC Records')),
			(5, (SELECT MusicCompanyID FROM MusicCompany WHERE MusicCompanyName = 'Spinnin Deep')),
			(6, (SELECT MusicCompanyID FROM MusicCompany WHERE MusicCompanyName = 'NoCopyrightSounds')),
			(7, (SELECT MusicCompanyID FROM MusicCompany WHERE MusicCompanyName = 'Spinnin Records')),
			(8, (SELECT MusicCompanyID FROM MusicCompany WHERE MusicCompanyName = 'Cherry Tree Records')),
			(9, (SELECT MusicCompanyID FROM MusicCompany WHERE MusicCompanyName = 'AFM Records')),
			(10,(SELECT MusicCompanyID FROM MusicCompany WHERE MusicCompanyName = 'Monstercat')),
			(11,(SELECT MusicCompanyID FROM MusicCompany WHERE MusicCompanyName = 'Sony Records')),
			(12,(SELECT MusicCompanyID FROM MusicCompany WHERE MusicCompanyName = 'CloudKid')),
			(13,(SELECT MusicCompanyID FROM MusicCompany WHERE MusicCompanyName = 'Interscope International')),
			(14,(SELECT MusicCompanyID FROM MusicCompany WHERE MusicCompanyName = 'Kitsune Music')),
			(15,(SELECT MusicCompanyID FROM MusicCompany WHERE MusicCompanyName = 'JYP')),
			(16,(SELECT MusicCompanyID FROM MusicCompany WHERE MusicCompanyName = 'AOMG')),
			(17,(SELECT MusicCompanyID FROM MusicCompany WHERE MusicCompanyName = 'DOTCOM')),
			(18,(SELECT MusicCompanyID FROM MusicCompany WHERE MusicCompanyName = 'GMM Grammys')),
			(19,(SELECT MusicCompanyID FROM MusicCompany WHERE MusicCompanyName = 'Beatmaker'));
			
			
			



CREATE TABLE AlbumGenres (
    GenreID INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
    Genre NVARCHAR(225) NOT NULL,


);

INSERT INTO AlbumGenres(Genre) VALUES ('Pop'), ('Visual Kei'), ('Dance'), ('Electronic'), ('Rap/Hip Hop'), ('J-Pop'), ('K-Rap'), ('Future Bass'), ('House'), ('Alternatives'), ('International'), ('Dubstep'), ('Progressive House'), ('Chillstep'), ('Future House'), ('Punk Rock'), ('ElectroSwing');


CREATE TABLE Albums(

  AlbumID INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
  ReleaseDate NVARCHAR (225) NOT NULL,
  AlbumName NVARCHAR(225) NOT NULL,
  ArtistID int NOT NULL,
  GenreID INT NOT NULL,

  

  FOREIGN KEY (ArtistID) REFERENCES dbo.Artists(ArtistID),

  FOREIGN KEY (GenreID) REFERENCES dbo.AlbumGenres(GenreID),


);

INSERT INTO Albums(AlbumName, ReleaseDate, GenreID, ArtistID) VALUES
			('The Fame', '2010-04-2',(SELECT GenreID FROM AlbumGenres WHERE Genre = 'Pop'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Lady Gaga')),
			('HEART', '2014-06-11', (SELECT GenreID FROM AlbumGenres WHERE Genre = 'Visual Kei') ,(SELECT ArtistID FROM Artists WHERE ArtistName = 'KAMIJO')),
			('WAP - Single', '2020-03-4',(SELECT GenreID FROM AlbumGenres WHERE Genre = 'Rap/Hip Hop'), (SELECT ArtistID FROM Artists WHERE ArtistName = 'Cardi B')),
			('Days to Come', '2015-06-18', (SELECT GenreID FROM AlbumGenres WHERE Genre = 'House'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Seven Lions')),
			('Last of Me - Single', '2020-07-9' ,(SELECT GenreID FROM AlbumGenres WHERE Genre = 'Future Bass'), (SELECT ArtistID FROM Artists WHERE ArtistName = 'Steve Aoki')),
			('Ascend', '2019-03-04',(SELECT GenreID FROM AlbumGenres WHERE Genre = 'Electronic'), (SELECT ArtistID FROM Artists WHERE ArtistName = 'Illenium')),
			('Kaleidoscope', '2008-02-7',(SELECT GenreID FROM AlbumGenres WHERE Genre = 'Chillstep'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Tiesto')),
			('Circus', '2006-09-10',(SELECT GenreID FROM AlbumGenres WHERE Genre = 'Pop'), (SELECT ArtistID FROM Artists WHERE ArtistName = 'Britney Spears')),
			('Searching For You - Single', '2013-05-9' ,(SELECT GenreID FROM AlbumGenres WHERE Genre = 'Dubstep'), (SELECT ArtistID FROM Artists WHERE ArtistName = 'Unlike Pluto')),
			('Monstercat 9th Anniversary Edition', '2018-04-2',(SELECT GenreID FROM AlbumGenres WHERE Genre = 'Future House'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Stonebank')),
			('o1', '2015-01-20', (SELECT GenreID FROM AlbumGenres WHERE Genre = 'International'), (SELECT ArtistID FROM Artists WHERE ArtistName = 'Hiroyuki Sawano')),
			('Dancin [Krono Remix] - Single', '2019-01-22', (SELECT GenreID FROM AlbumGenres WHERE Genre = 'Progressive House'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Aaron Smith')),
			('The Stereo Love Show' ,'2008-06-10', (SELECT GenreID FROM AlbumGenres WHERE Genre = 'International'), (SELECT ArtistID FROM Artists WHERE ArtistName = 'Edward Maya')),
			('Heavenly Blue - Single', '2016-11-12',(SELECT GenreID FROM AlbumGenres WHERE Genre = 'J-Pop'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Kalafina')),
			('Controlling Crowds Part IV', '2008-12-10',(SELECT GenreID FROM AlbumGenres WHERE Genre = 'Alternatives'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Archive')),
			('UN2VERSE', '2011-08-9', (SELECT GenreID FROM AlbumGenres WHERE Genre = 'K-Rap'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'JESSI')),
			('Chippin In - Single', '2020-07-22',(SELECT GenreID FROM AlbumGenres WHERE Genre = 'Punk Rock'), (SELECT ArtistID FROM Artists WHERE ArtistName = 'Refused')),
			('Oasis - EP', '2011-08-5',(SELECT GenreID FROM AlbumGenres WHERE Genre = 'Dance'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'MitiS')),
			('Bubbles', '2013-01-5',(SELECT GenreID FROM AlbumGenres WHERE Genre = 'ElectroSwing'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'ProleteR'))


			

CREATE TABLE AlbumArtist (
    AlbumArtistID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    ArtistID INT NOT NULL,
    SongID INT NOT NULL,
	AlbumID INT NOT NULL,

	FOREIGN KEY (ArtistID) REFERENCES dbo.Artists(ArtistID),

    FOREIGN KEY (SongID) REFERENCES dbo.Songs(SongID),

    FOREIGN KEY (AlbumID) REFERENCES dbo.Albums(AlbumID),

    
);

	

INSERT INTO AlbumArtist(AlbumID, SongID, ArtistID) VALUES
			((SELECT AlbumID FROM Albums WHERE AlbumName ='The Fame'),(SELECT SongID FROM Songs WHERE SongName = 'Poker Face'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Lady Gaga')),
			((SELECT AlbumID FROM Albums WHERE AlbumName ='Oasis - EP'), (SELECT SongID FROM Songs WHERE SongName = 'Prism'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'MitiS')),
			((SELECT AlbumID FROM Albums WHERE AlbumName ='HEART'),(SELECT SongID FROM Songs WHERE SongName = 'Heart'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'KAMIJO')),
			((SELECT AlbumID FROM Albums WHERE AlbumName ='Kaleidoscope'),(SELECT SongID FROM Songs WHERE SongName = 'Knock You Out'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Tiesto')),
			((SELECT AlbumID FROM Albums WHERE AlbumName ='Bubbles'),(SELECT SongID FROM Songs WHERE SongName = 'What Lana Says'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'ProleteR')),
			((SELECT AlbumID FROM Albums WHERE AlbumName ='Monstercat 9th Anniversary Edition'),(SELECT SongID FROM Songs WHERE SongName = 'Coming on Strong'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Stonebank')),
			((SELECT AlbumID FROM Albums WHERE AlbumName ='Last of Me - Single'), (SELECT SongID FROM Songs WHERE SongName = 'Last of Me'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Steve Aoki')),
			((SELECT AlbumID FROM Albums WHERE AlbumName ='Days to Come'),(SELECT SongID FROM Songs WHERE SongName = 'Fractals'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Seven Lions')),
			((SELECT AlbumID FROM Albums WHERE AlbumName ='Searching For You - Single'),(SELECT SongID FROM Songs WHERE SongName = 'Searching For You'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Unlike Pluto')),
			((SELECT AlbumID FROM Albums WHERE AlbumName ='UN2VERSE'),(SELECT SongID FROM Songs WHERE SongName = 'Gucci'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'JESSI')),
			((SELECT AlbumID FROM Albums WHERE AlbumName ='o1'),(SELECT SongID FROM Songs WHERE SongName = 'aLIEz'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Hiroyuki Sawano')),
			((SELECT AlbumID FROM Albums WHERE AlbumName ='Controlling Crowds Part IV'),(SELECT SongID FROM Songs WHERE SongName = 'Bullets'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Archive')),
			((SELECT AlbumID FROM Albums WHERE AlbumName ='Chippin In - Single'),(SELECT SongID FROM Songs WHERE SongName = 'Chippin In'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Refused')),
			((SELECT AlbumID FROM Albums WHERE AlbumName ='The Stereo Love Show'),(SELECT SongID FROM Songs WHERE SongName = 'Stereo Love'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Edward Maya')),
			((SELECT AlbumID FROM Albums WHERE AlbumName ='Ascend'),(SELECT SongID FROM Songs WHERE SongName = 'Takeaway'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Illenium')),
			((SELECT AlbumID FROM Albums WHERE AlbumName ='Circus'),(SELECT SongID FROM Songs WHERE SongName = 'Rock You In'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Britney Spears')),
			((SELECT AlbumID FROM Albums WHERE AlbumName ='Dancin [Krono Remix] - Single'),(SELECT SongID FROM Songs WHERE SongName = 'Dancin [Krono Remix]'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Aaron Smith')),
			((SELECT AlbumID FROM Albums WHERE AlbumName ='Heavenly Blue - Single'),(SELECT SongID FROM Songs WHERE SongName = 'Heavenly Blue'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Kalafina')),
			((SELECT AlbumID FROM Albums WHERE AlbumName ='WAP - Single'),(SELECT SongID FROM Songs WHERE SongName = 'WAP'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Cardi B'))
			

			




CREATE TABLE AlbumSongs (
    AlbumSongsID INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
    AlbumID INT NOT NULL,
    SongID int NOT NULL,



 FOREIGN KEY(SongID) REFERENCES dbo.Songs(SongID),

 FOREIGN KEY(AlbumID) REFERENCES dbo.Albums(AlbumID),
 

);
 
	INSERT INTO AlbumSongs(SongID, AlbumID) VALUES
			((SELECT SongID FROM Songs WHERE SongName ='WAP'),(SELECT AlbumID FROM Albums WHERE AlbumName = 'WAP - Single')),
			((SELECT SongID FROM Songs WHERE SongName ='Poker Face'),(SELECT AlbumID FROM Albums WHERE AlbumName = 'The Fame')),
			((SELECT SongID FROM Songs WHERE SongName ='Heart'),(SELECT AlbumID FROM Albums WHERE AlbumName = 'HEART')),
			((SELECT SongID FROM Songs WHERE SongName ='What Lana Says'),(SELECT AlbumID FROM Albums WHERE AlbumName = 'Bubbles')),
			((SELECT SongID FROM Songs WHERE SongName ='Knock You Out'),(SELECT AlbumID FROM Albums WHERE AlbumName = 'Kaleidoscope')),
			((SELECT SongID FROM Songs WHERE SongName ='Heavenly Blue'),(SELECT AlbumID FROM Albums WHERE AlbumName = 'Heavenly Blue - Single')),
			((SELECT SongID FROM Songs WHERE SongName ='Gucci'),(SELECT AlbumID FROM Albums WHERE AlbumName = 'UN2VERSE')) ,
			((SELECT SongID FROM Songs WHERE SongName ='Bullets'),(SELECT AlbumID FROM Albums WHERE AlbumName = 'Controlling Crowds Part IV')),
			((SELECT SongID FROM Songs WHERE SongName ='Rock You In'),(SELECT AlbumID FROM Albums WHERE AlbumName = 'Circus')),
			((SELECT SongID FROM Songs WHERE SongName ='Coming on Strong'),(SELECT AlbumID FROM Albums WHERE AlbumName = 'Monstercat 9th Anniversary Edition')),
			((SELECT SongID FROM Songs WHERE SongName ='aLIEz'),(SELECT AlbumID FROM Albums WHERE AlbumName = 'o1')),
			((SELECT SongID FROM Songs WHERE SongName ='Fractals'),(SELECT AlbumID FROM Albums WHERE AlbumName = 'Days to Come')),
			((SELECT SongID FROM Songs WHERE SongName ='Prism'),(SELECT AlbumID FROM Albums WHERE AlbumName = 'Oasis - EP')),
			((SELECT SongID FROM Songs WHERE SongName ='Chippin In'),(SELECT AlbumID FROM Albums WHERE AlbumName = 'Chippin In - Single')),
			((SELECT SongID FROM Songs WHERE SongName ='Last of Me'),(SELECT AlbumID FROM Albums WHERE AlbumName = 'Last of Me - Single')),
			((SELECT SongID FROM Songs WHERE SongName ='Stereo Love'),(SELECT AlbumID FROM Albums WHERE AlbumName = 'The Stereo Love Show')),
			((SELECT SongID FROM Songs WHERE SongName ='Dancin [Krono Remix]'),(SELECT AlbumID FROM Albums WHERE AlbumName = 'Dancin [Krono Remix] - Single')),
			((SELECT SongID FROM Songs WHERE SongName ='Takeaway'),(SELECT AlbumID FROM Albums WHERE AlbumName = 'Ascend')),
			((SELECT SongID FROM Songs WHERE SongName ='Searching For You'),(SELECT AlbumID FROM Albums WHERE AlbumName = 'Searching For You - Single'))
		




CREATE TABLE OrderSong (
    OrderSong INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    SongID INT NOT NULL,
    OrderID INT NOT NULL,


    FOREIGN KEY (OrderID) REFERENCES dbo.MusicOrder(OrderID),

    FOREIGN KEY (SongID) REFERENCES dbo.Songs(SongID),

);


	INSERT INTO OrderSong(OrderID, SongID) VALUES
			((SELECT OrderID FROM MusicOrder WHERE OrderDate = 'December 20th'),(SELECT SongID FROM Songs WHERE SongName = 'WAP')),
			((SELECT OrderID FROM MusicOrder WHERE OrderDate = 'January 22nd'),(SELECT SongID FROM Songs WHERE SongName = 'Poker Face')),
			((SELECT OrderID FROM MusicOrder WHERE OrderDate ='May 5th'),(SELECT SongID FROM Songs WHERE SongName = 'Heart')),
			((SELECT OrderID FROM MusicOrder WHERE OrderDate ='April 12th'),(SELECT SongID FROM Songs WHERE SongName = 'What Lana Says')),
			((SELECT OrderID FROM MusicOrder WHERE OrderDate ='September 2nd'),(SELECT SongID FROM Songs WHERE SongName = 'Knock You Out')),
			((SELECT OrderID FROM MusicOrder WHERE OrderDate ='February 6th'),(SELECT SongID FROM Songs WHERE SongName = 'Heavenly Blue')),
			((SELECT OrderID FROM MusicOrder WHERE OrderDate ='July 5th'),(SELECT SongID FROM Songs WHERE SongName = 'Gucci')),
			((SELECT OrderID FROM MusicOrder WHERE OrderDate ='June 10th'),(SELECT SongID FROM Songs WHERE SongName = 'Bullets')),
			((SELECT OrderID FROM MusicOrder WHERE OrderDate ='August 22nd'),(SELECT SongID FROM Songs WHERE SongName = 'Rock You In')),
			((SELECT OrderID FROM MusicOrder WHERE OrderDate ='December 3rd'),(SELECT SongID FROM Songs WHERE SongName = 'Coming on Strong')),
			((SELECT OrderID FROM MusicOrder WHERE OrderDate ='October 5th'),(SELECT SongID FROM Songs WHERE SongName = 'aLIEz')),
			((SELECT OrderID FROM MusicOrder WHERE OrderDate ='March 4th'),(SELECT SongID FROM Songs WHERE SongName = 'Fractals')),
			((SELECT OrderID FROM MusicOrder WHERE OrderDate ='May 7th'),(SELECT SongID FROM Songs WHERE SongName = 'Prism')),
			((SELECT OrderID FROM MusicOrder WHERE OrderDate ='December 5th'),(SELECT SongID FROM Songs WHERE SongName = 'Chippin In')),
			((SELECT OrderID FROM MusicOrder WHERE OrderDate ='August 10th'),(SELECT SongID FROM Songs WHERE SongName = 'Last of Me')),
			((SELECT OrderID FROM MusicOrder WHERE OrderDate ='April 10th'),(SELECT SongID FROM Songs WHERE SongName = 'Stereo Love')),
			((SELECT OrderID FROM MusicOrder WHERE OrderDate ='September 8th'),(SELECT SongID FROM Songs WHERE SongName = 'Dancin [Krono Remix]')),
			((SELECT OrderID FROM MusicOrder WHERE OrderDate ='April 20th'),(SELECT SongID FROM Songs WHERE SongName = 'Takeaway')),
			((SELECT OrderID FROM MusicOrder WHERE OrderDate ='July 18th'),(SELECT SongID FROM Songs WHERE SongName = 'Searching For You'))

			
	



CREATE TABLE ArtistCustomer (
    ArtistCustomerID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    CustomerID int NOT NULL,
    ArtistID int NOT NULL,


    FOREIGN KEY (ArtistID) REFERENCES dbo.Artists(ArtistID),

    FOREIGN KEY (CustomerID) REFERENCES dbo.Customer(CustomerID),


);

INSERT INTO ArtistCustomer(CustomerID, ArtistID) VALUES
			((SELECT CustomerID From Customer WHERE CustomerName = 'Jane'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'KAMIJO')),
			((SELECT CustomerID From Customer WHERE CustomerName ='John'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Lady Gaga')),
			((SELECT CustomerID From Customer WHERE CustomerName ='Becky'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Cardi B')),
			((SELECT CustomerID From Customer WHERE CustomerName ='Nikki'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Seven Lions')),
			((SELECT CustomerID From Customer WHERE CustomerName ='Alex'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Steve Aoki')),
			((SELECT CustomerID From Customer WHERE CustomerName ='Mary'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Tiesto')),
			((SELECT CustomerID From Customer WHERE CustomerName ='Joshua'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Britney Spears')),
			((SELECT CustomerID From Customer WHERE CustomerName ='Jack'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Unlike Pluto')),
			((SELECT CustomerID From Customer WHERE CustomerName ='Bobby'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Stonebank')),
			((SELECT CustomerID From Customer WHERE CustomerName ='Louis'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Hiroyuki Sawano')),
			((SELECT CustomerID From Customer WHERE CustomerName ='Rick'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Edward Maya')),
			((SELECT CustomerID From Customer WHERE CustomerName ='Billy'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Kalafina')),
			((SELECT CustomerID From Customer WHERE CustomerName ='Dill'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Archive')),
			((SELECT CustomerID From Customer WHERE CustomerName ='Shallon'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'JESSI')),
			((SELECT CustomerID From Customer WHERE CustomerName ='Johnny'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Refused')),
			((SELECT CustomerID From Customer WHERE CustomerName ='Alastor'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Illenium')),
			((SELECT CustomerID From Customer WHERE CustomerName ='Bree'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'Aaron Smith')),
			((SELECT CustomerID From Customer WHERE CustomerName ='Jim'),(SELECT ArtistID FROM Artists WHERE ArtistName = 'MitiS')),
			((SELECT CustomerID From Customer WHERE CustomerName ='Joe'), (SELECT ArtistID FROM Artists WHERE ArtistName = 'ProleteR'))

		


GO

