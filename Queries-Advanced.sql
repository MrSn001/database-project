use Airport_System



select 
	f.FlightNumber,
	o.AirportName As Origin,
	d.AirportName As Destination,
	a.Model As AircraftModel,
	COUNT (b.BookingID) As TotalPassengers

from Flights f
Inner join Airports o On f.OriginCode = o.IATA_Code
Inner join Airports d On f.DestinationCode = d.IATA_Code
Inner join Aircrafts a On f.AircraftID = a.AircraftID
Left join Bookings b On f.FlightID = b.FlightID
Group by 
	f.FlightNumber,
	o.AirportName,
	d.AirportName,
	a.Model

SELECT 
    p.PassengerID, 
    p.FullName, 
    p.Email
FROM Passengers p
Left JOIN Bookings b ON p.PassengerID = b.PassengerID
WHERE b.BookingID IS NULL;

select f.FlightNumber, SUM(b.Price) as TotalRevenue
from Flights f
inner join Bookings b On f.FlightID = b.FlightID
group by f.FlightNumber
Having SUM(b.Price) > 500
order by TotalRevenue desc


SELECT 
    c.FullName, 
    COUNT(fc.FlightID) AS TotalNumberOfFlights
FROM CrewMembers c
INNER JOIN FlightCrew fc ON c.CrewID = fc.CrewID
GROUP BY c.CrewID, c.FullName 
HAVING COUNT(fc.FlightID) > 1;

