Alter table Flights add airline_id int, gate_id int

alter table Flights add constraint fk_Flights_airline 
			foreign key (airline_id) 
			REFERENCES Airline(AirlineId) 
			On delete no action on update no action

Alter table Flights add 
		constraint fk_Flights_gate foreign key (gate_id)
		References Gate(GateID)
		on delete set null on update cascade