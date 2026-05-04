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



select f.FlightNumber, AVG(b.Price) as AveragePrice
from Flights f
inner join Bookings b On f.FlightID = b.FlightID
group by f.FlightNumber
having AVG(b.Price)> (select AVG(price) from Bookings)



select top 1
f.FlightNumber, 
o.AirportName as OriginAirportName,
d.AirportName as DestinationAirportName,
COUNT(b.BookingID) as NumOfBooking
from Flights f
inner join Bookings b On f.FlightID = b.FlightID
inner join Airports o On f.OriginCode = o.IATA_Code
inner join Airports d On f.DestinationCode = d.IATA_Code
group by f.FlightNumber, o.AirportName,d.AirportName
order by NumOfBooking desc



select sum(b.Price) as TotalRevenue,
COUNT(b.BookingID) as NumOfBooking,
AVG(b.Price) as AveragePrice,
MAX(b.Price) as HighestPrice,
MIN(b.Price) as LowestPrice
from Bookings b
group by b.Class


select 
	p.FullName as PassengerName,
	f.FlightNumber,
	b.BookingDate
from Bookings b
inner join Flights f On b.FlightID = f.FlightID
inner join Passengers p On b.PassengerID = p.PassengerID
where f.Status = 'Cancelled'


select 
	f.FlightNumber,
	COUNT(fc.CrewID) as NumberOfCrewMembers,
	f.DepartureDateTime

from Flights f
inner join FlightCrew fc On f.FlightID =fc.FlightID
where exists(
	select 1 from FlightCrew fc1
	inner join CrewMembers c1 On fc1.CrewID = c1.CrewID
	where fc1.FlightID = f.FlightID and c1.Role = 'Pilot')
And Exists(
	select 1 from FlightCrew fc2
	inner join CrewMembers c2 On fc2.CrewID = c2.CrewID
	where fc2.FlightID = f.FlightID and c2.Role = 'Flight Attendant')
group by f.FlightNumber,f.DepartureDateTime



