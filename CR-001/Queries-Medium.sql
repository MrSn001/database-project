use Airport_System

--1
select f.FlightNumber,a.AirlineFullName,g.Gate_Code from Flights f
inner join Airline a On f.airline_id = a.AirlineId
inner join gate g On f.gate_id = g.GateID

--2
select p.FullName,f.FlightNumber,b.Tag_Number from Baggage b
inner join Bookings bk On b.booking_id = bk.BookingID
inner join Passengers p On bk.PassengerID = p.PassengerID
inner join Flights f On bk.FlightID = f.FlightID

--3
select 
b.booking_id,
p.FullName,
count(b.booking_id) As TotalBaggage
from Baggage b
inner join Bookings bk On b.booking_id = bk.BookingID
inner join Passengers p On bk.PassengerID = p.PassengerID 
group by b.booking_id, p.FullName

--4
select f.FlightNumber,a.AirlineFullName,fld.reason, fld.duration_minutes
from FlightDelayLog fld
inner join Flights f On fld.flight_id = f.FlightID
inner join Airline a On f.airline_id = a.AirlineId

--5
select f.FlightNumber,sum(b.Weight_kg) as TotalCheckedWeight
from Baggage b
inner join Bookings bk On b.booking_id = bk.BookingID
inner join Flights f On bk.FlightID = f.FlightID
where type = 'Checked'
group by FlightNumber

