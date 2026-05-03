use Airport_System


-- Update Part
update Flights set Status = 'Completed' 
where FlightNumber ='SK101'

update Flights set Status = 'Cancelled'
where FlightNumber = 'SK103'

update Bookings set Price = (Price * 0.1) + Price
where Class = 'Economy'

update Passengers set Phone = '+96891239922'
where NationalID = '99887766'

update CrewMembers set Role = 'Engineer'
where LicenseNumber = 'L-006'


--Delete Part
SELECT * FROM Flights WHERE Status = 'Cancelled';

DELETE FROM Flights WHERE FlightNumber = 'SK104';

SELECT b.* 
FROM Bookings b
JOIN Flights f ON b.FlightID = f.FlightID
WHERE f.Status = 'Cancelled';

DELETE FROM Bookings 
WHERE BookingID = 5;


select * from Bookings

delete from Passengers where PassengerID = 1

/* The Delete Worked because we have used cascade to the
foregin keys so anything deleted in the parent table will 
be removed in the child table*/
