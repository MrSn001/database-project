use Airport_System

select FlightNumber,Status,DepartureDateTime
from Flights 
order by DepartureDateTime asc

select * 
from Passengers
order by FullName asc

select RegistrationNumber,Model, Capacity 
from Aircrafts
order by Capacity desc

select distinct Class
from Bookings

select FlightID, FlightNumber, Status 
from Flights
where Status IN ('Delayed','Cancelled')

select * 
from Passengers
where Nationality = 'Omani'


select * 
from Airports
order by Country