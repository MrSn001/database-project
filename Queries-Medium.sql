use Airport_System

select
	f.FlightNumber,
	o.AirportName as originAirportName,
	d.AirportName as destinationAirportName
from Flights f
Inner join Airports o On f.OriginCode = o.IATA_Code
Inner join Airports d On f.DestinationCode = d.IATA_Code


select 
	b.BookingID,
	p.FullName as FullName,
	f.FlightNumber as FlightNumber
from Bookings b

Inner join Passengers p On b.PassengerID = p.PassengerID
Inner join Flights f On b.FlightID = f.FlightID


select 
	fs.FlightNumber,
	c.FullName,
	c.Role
from FlightCrew f
Inner join Flights fs On f.FlightID = fs.FlightID
Inner join CrewMembers c On f.CrewID = c.CrewID
where fs.FlightNumber = 'SK101'


select 
	f.FlightNumber,
	f.Status,
	a.Model
from Flights f
Inner join Aircrafts a On f.AircraftID = a.AircraftID
where f.Status = 'Completed'

select p.FullName, COUNT(b.BookingID) as NumberOfBooking

from Passengers p
Inner join Bookings b On p.PassengerID = b.PassengerID
group by p.PassengerID, p.FullName
order by NumberOfBooking desc

select Class, SUM(Price) as totalRevenue
from Bookings
group by Class

SELECT 
    a.RegistrationNumber, 
    a.Model, 
    COUNT(f.FlightID) AS TotalFlightsAssigned
FROM Aircrafts a
LEFT JOIN Flights f ON a.AircraftID = f.AircraftID
GROUP BY a.RegistrationNumber, a.Model;

select 
    f.FlightNumber, 
    COUNT(b.BookingID) as TotalBookings
from Flights f
INNER JOIN Bookings b On f.FlightID = b.FlightID
group by f.FlightNumber
having COUNT(b.BookingID) > 1

select 
	p.FullName,
	f.FlightNumber,
	a.AirportName as OriginAirportName,
	ad.AirportName as DestinationAirportName,
	b.Class,
	b.Price
from Bookings b
Inner join Passengers p On b.PassengerID = p.PassengerID
Inner join Flights f On b.FlightID = f.FlightID
Inner join Airports a On f.OriginCode = a.IATA_Code
Inner join Airports ad On f.DestinationCode = ad.IATA_Code
