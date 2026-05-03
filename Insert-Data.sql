use Airport_System

INSERT INTO Airports VALUES ('MCT', 'Muscat Intl', 'Muscat', 'Oman'),
                            ('DXB', 'Dubai Intl', 'Dubai', 'UAE'),
                            ('LHR', 'Heathrow', 'London', 'UK'),
                            ('JFK', 'John F. Kennedy', 'New York', 'USA'),
                            ('CDG', 'Charles de Gaulle', 'Paris', 'France');

INSERT INTO Aircrafts (RegistrationNumber, Model, Manufacturer, Capacity, ManufactureYear)
VALUES ('A6-EBN', 'B777', 'Boeing', 350, 2018),
       ('A4O-SA', 'A320', 'Airbus', 180, 2020),
       ('G-VLUX', 'A350', 'Airbus', 300, 2021),
       ('N123AF', '737 Max', 'Boeing', 200, 2022),
       ('F-GZCK', 'A330', 'Airbus', 250, 2017);

INSERT INTO Passengers (FullName, NationalID, Email, Phone, Nationality, DoB) VALUES 
('Ahmed Al-Sabri', '99887766', 'ahmed.s@outlook.com', '+96891234567', 'Omani', '1990-05-15'),
('Sarah Smith', '11223344', 's.smith@gmail.com', '+447712345678', 'British', '1985-11-20'),
('Jean Dupont', 'FR554433', 'j.dupont@orange.fr', '+33612345678', 'French', '1992-03-10'),
('Fatma Al-Raisi', '88776655', 'fatma.r@gmail.com', '+96899887766', 'Omani', '1998-07-22'),
('John Doe', 'US112299', 'j.doe@yahoo.com', '+12125550199', 'American', '1980-01-01'),
('Khalid Al-Balushi', '77665544', 'khalid.b@me.com', '+96895554433', 'Omani', '1995-12-12'),
('Emma Wilson', 'UK998811', 'emma.w@work.co.uk', '+447788990011', 'British', '1993-09-05'),
('Mohammed Rashid', 'AE223344', 'm.rashid@emirates.ae', '+971501234567', 'Emirati', '1988-04-30');


INSERT INTO Flights (FlightNumber, DepartureDateTime, ArrivalDateTime, Status, AircraftID, OriginCode, DestinationCode) VALUES 
('SK101', '2026-05-10 08:00', '2026-05-10 10:00', 'Scheduled', 1, 'MCT', 'DXB'),
('SK102', '2026-05-11 14:00', '2026-05-11 22:00', 'Completed', 2, 'DXB', 'LHR'),
('SK103', '2026-05-12 09:00', '2026-05-12 18:00', 'Delayed', 3, 'LHR', 'JFK'),
('SK104', '2026-05-13 11:00', '2026-05-13 13:00', 'Cancelled', 4, 'JFK', 'CDG'),
('SK105', '2026-05-14 20:00', '2026-05-15 05:00', 'Scheduled', 5, 'CDG', 'MCT'),
('SK106', '2026-05-15 01:00', '2026-05-15 04:00', 'Completed', 1, 'MCT', 'DXB'),
('SK107', '2026-05-16 10:00', '2026-05-16 18:00', 'Scheduled', 2, 'LHR', 'JFK'),
('SK108', '2026-05-17 06:00', '2026-05-17 12:00', 'Scheduled', 3, 'CDG', 'DXB');

INSERT INTO Bookings (PassengerID, FlightID, SeatNumber, Class, Price, BookingDate) VALUES 
(1, 1, '12A', 'Economy', 150.00, '2026-04-01'),
(2, 1, '01A', 'First', 800.00, '2026-04-02'),
(3, 2, '14C', 'Economy', 250.00, '2026-04-05'),
(4, 2, '05B', 'Business', 500.00, '2026-04-07'),
(5, 3, '10F', 'Economy', 300.00, '2026-04-10'),
(6, 4, '22A', 'Economy', 180.00, '2026-04-12'),
(7, 5, '08D', 'Business', 600.00, '2026-04-15'),
(8, 6, '02C', 'First', 950.00, '2026-04-18'),
(1, 7, '15F', 'Economy', 320.00, '2026-04-20'),
(2, 8, '04E', 'Business', 550.00, '2026-04-22');


INSERT INTO CrewMembers (FullName, Role, LicenseNumber) VALUES 
('Capt. Salim Ali', 'Pilot', 'L-001'),
('First Officer Jane', 'Co-Pilot', 'L-002'),
('Mona Al-Zadjali', 'Flight Attendant', 'L-003'),
('Thomas Miller', 'Flight Attendant', 'L-004'),
('Eng. Robert Blake', 'Engineer', 'L-005'),
('Sara Al-Farsi', 'Flight Attendant', 'L-006');

INSERT INTO FlightCrew (FlightID, CrewID) VALUES 
(1, 1), (1, 3),
(2, 1), (2, 4),
(3, 2), (3, 6),
(4, 2), (4, 3), 
(5, 1), (5, 4), 
(6, 1), (6, 6), 
(7, 2), (7, 3), 
(8, 2), (8, 4);