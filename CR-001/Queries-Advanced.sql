use Airport_System

--1
select
	a.AirlineFullName, 
	COUNT(distinct f.FlightID)as TotalNumberOfFlights,
	COUNT(b.BookingID) as TotalNumberOfPassengers,
	SUM(b.Price) as TotalRevenue
from Flights f
inner join Airline a On f.airline_id = a.AirlineId 
inner join Bookings b On f.FlightID = b.FlightID
group by a.AirlineFullName


--2
select top 1 g.Gate_Code,
g.terminal,
a.AirportName,
COUNT(distinct f.FlightID) as flightCount
from Flights f
inner join Gate g On f.gate_id = g.GateID
inner join Airports a On g.airport_id = a.IATA_Code
group by g.Gate_Code,g.terminal,a.AirportName
order by flightCount desc


--3
Select 
f.FlightNumber,
a.AirlineFullName, 
COUNT(fdl.delay_id) as totalNumberOfDelay,
sum (fdl.duration_minutes) as totalMinUtesDelay
from FlightDelayLog fdl
inner join Flights f On fdl.flight_id = f.FlightID
inner join Airline a On f.airline_id = a.AirlineId
group by f.FlightNumber, a.AirlineFullName



--4
select 
p.FullName,
COUNT(b.Baggage_id) as numberOfBaggages,
b.type
from Baggage b
inner join Bookings bk On b.booking_id = bk.BookingID
inner join Passengers p On bk.PassengerID = p.PassengerID
group by p.FullName,b.type



--5
select 
f.FlightNumber, 
o.AirportName as OriginAirport ,
d.AirportName as DestinationAirport,
SUM(b.Price) as TotalRevenue 

from Flights f
inner join Airline al On f.airline_id = al.AirlineId
inner join Airports o On f.OriginCode = o.IATA_Code
inner join Airports d On f.DestinationCode = d.IATA_Code
inner join Bookings b On f.FlightID = b.FlightID
where al.Country_Of_Registration = 'Oman'
group by f.FlightNumber,o.AirportName,d.AirportName



--6
SELECT 
    f.FlightNumber,
    al.AirlineFullName,
    ISNULL(g.Gate_Code, 'N/A') AS GateCode,
    o.City AS OriginCity,
    d.City AS DestinationCity,
    COUNT(DISTINCT bk.BookingID) AS TotalPassengersBooked,
    COUNT(DISTINCT b.Baggage_id) AS TotalBaggageItems,
    -- Using a Subquery for Delays ensures we don't multiply durations by passengers
    ISNULL((SELECT SUM(duration_minutes) FROM FlightDelayLog WHERE flight_id = f.FlightID), 0) AS TotalDelayDuration,
    SUM(bk.Price) AS TotalRevenue -- Revenue is safe here because we group by flight
FROM Flights f
INNER JOIN Airline al ON f.airline_id = al.AirlineId
INNER JOIN Airports o ON f.OriginCode = o.IATA_Code
INNER JOIN Airports d ON f.DestinationCode = d.IATA_Code
LEFT JOIN Gate g ON f.gate_id = g.GateID -- Left join so we don't hide flights without gates
LEFT JOIN Bookings bk ON f.FlightID = bk.FlightID
LEFT JOIN Baggage b ON bk.BookingID = b.booking_id
GROUP BY f.FlightID, f.FlightNumber, al.AirlineFullName, g.Gate_Code, o.City, d.City
ORDER BY TotalRevenue DESC; -- Requirement: Highest to lowest revenue


