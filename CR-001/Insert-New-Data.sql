-- TASK 4: INSERT SAMPLE DATA (CR-001)

-- 1. Insert at least 4 Airlines
INSERT INTO Airline (IATA_Airline, AirlineFullName, Country_Of_Registration, Contact_Email)
VALUES 
('WY', 'Oman Air', 'Oman', 'ops@omanair.com'),
('EK', 'Emirates', 'UAE', 'info@emirates.com'),
('BA', 'British Airways', 'UK', 'support@ba.com'),
('AF', 'Air France', 'France', 'contact@airfrance.fr');

-- 2. Insert at least 8 Gates across at least 3 Airports
-- Referencing MCT (Muscat), DXB (Dubai), and LHR (London) from your data
INSERT INTO Gate (Gate_Code, terminal, airport_id)
VALUES 
('A1', 'Terminal 1', 'MCT'),
('A2', 'Terminal 1', 'MCT'),
('B1', 'Concourse B', 'DXB'),
('B2', 'Concourse B', 'DXB'),
('C1', 'Terminal 5', 'LHR'),
('C2', 'Terminal 5', 'LHR'),
('D1', 'Terminal 2E', 'CDG'),
('D2', 'Terminal 2E', 'CDG');

-- 3. Update at least 6 existing flights to assign Airline and Gate
-- Logic: Flights from MCT use MCT gates, DXB use DXB gates, etc.
UPDATE Flights SET airline_id = 1, gate_id = 1 WHERE FlightID = 1; -- MCT to DXB
UPDATE Flights SET airline_id = 3, gate_id = 5 WHERE FlightID = 2; -- DXB to LHR
UPDATE Flights SET airline_id = 3, gate_id = 6 WHERE FlightID = 3; -- LHR to JFK
UPDATE Flights SET airline_id = 4, gate_id = 7 WHERE FlightID = 5; -- CDG to MCT
UPDATE Flights SET airline_id = 1, gate_id = 2 WHERE FlightID = 6; -- MCT to DXB
UPDATE Flights SET airline_id = 3, gate_id = 5 WHERE FlightID = 7; -- LHR to JFK
UPDATE Flights SET airline_id = 2, gate_id = 3 WHERE FlightID = 4; -- DXB origin
UPDATE Flights SET airline_id = 4, gate_id = 8 WHERE FlightID = 8; -- CDG origin
-- After updating, set airline_id to NOT NULL as per Task 3 instructions
ALTER TABLE Flights ALTER COLUMN airline_id INT NOT NULL;

-- 4. Insert at least 10 Baggage records distributed across bookings
INSERT INTO Baggage (tag_number, weight_kg, type, booking_id)
VALUES 
('TAG001', 23.5, 'Checked', 2),
('TAG002', 7.0, 'Cabin', 2),
('TAG003', 20.0, 'Checked', 3),
('TAG004', 25.0, 'Checked', 4),
('TAG005', 8.0, 'Cabin', 4),
('TAG006', 15.0, 'Checked', 7),
('TAG007', 22.0, 'Checked', 8),
('TAG008', 6.5, 'Cabin', 8),
('TAG009', 18.0, 'Checked', 10),
('TAG010', 5.0, 'Cabin', 10);

-- 5. Insert at least 4 Delay Logs
-- Linked only to flights with status 'Cancelled' (ID 2 and 3) as per your screenshot
INSERT INTO FlightDelayLog (reason, duration_minutes, recorded_at, flight_id)
VALUES 
('Technical issue with engine', 120, '2026-05-11 13:00:00', 2),
('Severe weather at destination', 45, '2026-05-11 13:45:00', 2),
('Late arrival of incoming aircraft', 60, '2026-05-12 08:00:00', 3),
('Crew scheduling conflict', 30, '2026-05-12 08:45:00', 3);