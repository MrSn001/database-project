use Airport_System

Create Table Airline (AirlineId int primary key identity(1,1),
					  IATA_Airline char(3) unique not null ,
					  AirlineFullName varchar(100) unique not null ,
					  Country_Of_Registration varchar(100) not null,
					  Contact_Email varchar(100) unique not null)


Create Table Gate (GateID int primary key identity(1,1),
				   Gate_Code varchar(10) not null,
				   terminal varchar(50) not null,
				   airport_id char(3) not null,
				   Constraint FK_Gate_Airport Foreign key (airport_id)
						REFERENCES Airports(IATA_Code),
				   Constraint UQ_Gate_Airport UNIQUE (Gate_Code,airport_id))


Create Table Baggage (Baggage_id int primary key identity(1,1),
					  Tag_Number varchar(50) unique not null,
					  Weight_kg decimal(5,2) not null check (Weight_kg >0),
					  type varchar(10) not null check(type in ('Cabin', 'Checked')),
					  booking_id int not null,
					  Constraint fk_baggage_booking foreign key (booking_id)
						REFERENCES Bookings(BookingID)
						On Delete Cascade On Update Cascade)

Create Table FlightDelayLog (delay_id int primary key identity (1,1),
							reason varchar (MAX) not null,
							duration_minutes int not null check(duration_minutes > 0),
							recorded_at datetime not null,
							flight_id int not null,
							constraint fk_FlightDelayLog_flight foreign key (flight_id)
								REFERENCES Flights(FlightID)
								On delete Cascade On Update Cascade)




	