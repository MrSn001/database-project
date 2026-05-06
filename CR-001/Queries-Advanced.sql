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
