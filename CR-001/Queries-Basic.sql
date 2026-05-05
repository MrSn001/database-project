--1
select AirlineFullName,Country_Of_Registration from Airline
order by AirlineFullName asc

--2
select g.Gate_Code,a.AirportName from Gate g
inner join Airports a On g.airport_id =a.IATA_Code

--3
select type,Weight_kg 
from Baggage
order by Weight_kg desc

--4
select f.FlightNumber,fdl.recorded_at from FlightDelayLog fdl
inner join Flights f On fdl.flight_id = f.FlightID
order by fdl.recorded_at

--5
select FlightNumber, Status, OriginCode,DestinationCode 
from Flights 
where gate_id is null


