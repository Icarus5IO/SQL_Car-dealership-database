-- Create Salesperson table
CREATE TABLE Salesperson (
    salesperson_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    contact_number VARCHAR(15)
);

-- Create Customer table
CREATE TABLE Customer (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    contact_number VARCHAR(15)
);

-- Create Car table
CREATE TABLE Car (
    car_id SERIAL PRIMARY KEY,
    make VARCHAR(50),
    model VARCHAR(50),
    year INTEGER,
    serial_number INTEGER,
    salesperson_id INTEGER REFERENCES Salesperson(salesperson_id),
    customer_id INTEGER REFERENCES Customer(customer_id)
);

-- Create Invoice table
CREATE TABLE Invoice (
    invoice_id SERIAL PRIMARY KEY,
    car_id INTEGER REFERENCES Car(car_id),
    salesperson_id INTEGER REFERENCES Salesperson(salesperson_id),
    customer_id INTEGER REFERENCES Customer(customer_id),
    amount INTEGER,
    date DATE
);

-- Create Mechanic table
CREATE TABLE Mechanic (
    mechanic_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    contact_number VARCHAR(15)
);

-- Create Parts table
CREATE TABLE Parts (
    part_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    description VARCHAR(150),
    quantity INTEGER,
    price INTEGER
);

-- Create Service Ticket table
CREATE TABLE Service_Ticket (
    ticket_id SERIAL PRIMARY KEY,
    car_id INTEGER REFERENCES Car(car_id),
    customer_id INTEGER REFERENCES Customer(customer_id),
    mechanic_id INTEGER REFERENCES Mechanic(mechanic_id),
    part_id INTEGER REFERENCES Parts(part_id),
    date DATE
);

-- Create Service History table
CREATE TABLE Service_History (
    history_id SERIAL PRIMARY KEY,
    car_id INTEGER REFERENCES Car(car_id),
    customer_id INTEGER REFERENCES Customer(customer_id),
    service_details VARCHAR(150),
    service_date DATE
);

-- Create Car_Mechanic junction table
CREATE TABLE Car_Mechanic (
    car_id INTEGER REFERENCES Car(car_id),
    mechanic_id INTEGER REFERENCES Mechanic(mechanic_id),
    PRIMARY KEY (car_id, mechanic_id)
);

-- Create Service_Ticket_Parts junction table
CREATE TABLE Service_Ticket_Parts (
    ticket_id INTEGER REFERENCES Service_Ticket(ticket_id),
    part_id INTEGER REFERENCES Parts(part_id),
    quantity INTEGER,
    PRIMARY KEY (ticket_id, part_id)
);
