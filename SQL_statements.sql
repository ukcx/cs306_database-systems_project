
CREATE TABLE Passengers(
    pid VARCHAR(10),
    full_name VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(50),
    p_type VARCHAR(10),
    PRIMARY KEY (pid)
)

CREATE TABLE Airports(
port_id VARCHAR(20),
city VARCHAR(20),
country VARCHAR(20),
    	PRIMARY KEY (port_id)
)

CREATE TABLE Airlines(
	line_id VARCHAR(20),
	line_name VARCHAR(30),
   	PRIMARY KEY(line_id)
)

CREATE TABLE Flights(
    fid VARCHAR(20),
    take_off_time TIME,
    take_off_date DATE,
    arrival_time TIME,
    destination VARCHAR(20) NOT NULL,
    take_off_place VARCHAR(20) NOT NULL,
    lineID VARCHAR(20) NOT NULL,
    PRIMARY KEY(fid),
    FOREIGN KEY(destination) REFERENCES airports(port_id)
	ON DELETE CASCADE,
    FOREIGN KEY(take_off_place) REFERENCES airports(port_id)
	ON DELETE CASCADE,
   FOREIGN KEY(lineID) REFERENCES airlines(line_id)
	ON DELETE CASCADE
)	

CREATE TABLE Tickets(
    tid VARCHAR(20) NOT NULL,
    class VARCHAR(20),
    seat_no INTEGER,
    price REAL,
    flight_id VARCHAR(20) NOT NULL,
    passenger_id VARCHAR(20) NOT NULL,
    PRIMARY KEY(tid),
    FOREIGN KEY(flight_id) REFERENCES flights(fid) 
    	ON DELETE CASCADE,
    FOREIGN KEY(passenger_id) REFERENCES passengers(pid)
    	ON DELETE CASCADE
)

