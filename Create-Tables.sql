Create database Airport_System

use Airport_System

Create Table Airports (IATA_Code char(3) primary key,
	AirportName varchar (25) NOT NULL,
    City varchar (25) NOT NULL,
	Country varchar(25) NOT NULL)



CREATE TABLE Aircrafts (
    AircraftID INT IDENTITY(1,1) PRIMARY KEY,
    RegistrationNumber VARCHAR(20) UNIQUE NOT NULL,
    Model VARCHAR(50) NOT NULL,
    Manufacturer VARCHAR(50) NOT NULL,
    Capacity INT NOT NULL CHECK (Capacity > 0),
    ManufactureYear INT)

CREATE TABLE Flights (
    FlightID INT IDENTITY(1,1) PRIMARY KEY,
    FlightNumber NVARCHAR(20) UNIQUE NOT NULL,
    DepartureDateTime DATETIME NOT NULL,
    ArrivalDateTime DATETIME NOT NULL,
    Status NVARCHAR(20) DEFAULT 'Scheduled' NOT NULL,
    AircraftID INT NOT NULL,
    OriginCode CHAR(3) NOT NULL,
    DestinationCode CHAR(3) NOT NULL,
    CONSTRAINT CK_FlightStatus CHECK (Status IN ('Scheduled', 'Delayed', 'Cancelled', 'Completed')),
    CONSTRAINT CK_ArrivalAfterDeparture CHECK (ArrivalDateTime > DepartureDateTime),
    FOREIGN KEY (AircraftID) REFERENCES Aircrafts(AircraftID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (OriginCode) REFERENCES Airports(IATA_Code) ON DELETE NO ACTION,
    FOREIGN KEY (DestinationCode) REFERENCES Airports(IATA_Code) ON DELETE NO ACTION)

CREATE TABLE Passengers (
    PassengerID INT IDENTITY(1,1) PRIMARY KEY,
    NationalID NVARCHAR(50) UNIQUE NOT NULL,
    FullName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    Phone NVARCHAR(20),
    Nationality NVARCHAR(50) NOT NULL,
    DoB DATE NOT NULL)

CREATE TABLE Bookings (
    BookingID INT IDENTITY(1,1) PRIMARY KEY,
    PassengerID INT NOT NULL,
    FlightID INT NOT NULL,
    SeatNumber NVARCHAR(10) NOT NULL,
    Class NVARCHAR(20) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL CHECK (Price > 0),
    BookingDate DATE DEFAULT GETDATE() NOT NULL,
    CONSTRAINT CK_BookingClass CHECK (Class IN ('Economy', 'Business', 'First')),
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID) ON DELETE CASCADE ON UPDATE CASCADE)

CREATE TABLE CrewMembers (
    CrewID INT IDENTITY(1,1) PRIMARY KEY,
    LicenseNumber NVARCHAR(50) UNIQUE NOT NULL,
    FullName NVARCHAR(100) NOT NULL,
    Role NVARCHAR(50) NOT NULL,
    CONSTRAINT CK_CrewRole CHECK (Role IN ('Pilot', 'Co-Pilot', 'Flight Attendant', 'Engineer')))

CREATE TABLE FlightCrew (
    FlightID INT NOT NULL,
    CrewID INT NOT NULL,
    PRIMARY KEY (FlightID, CrewID),
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (CrewID) REFERENCES CrewMembers(CrewID) ON DELETE CASCADE ON UPDATE CASCADE)
