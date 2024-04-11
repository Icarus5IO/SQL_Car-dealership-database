INSERT INTO Salesperson (first_name, last_name, contact_number) VALUES
('John', 'Doe', '123-456-7890'),
('Jane', 'Smith', '987-654-3210');

INSERT INTO Customer (first_name, last_name, contact_number) VALUES
('Alice', 'Johnson', '555-123-4567'),
('Bob', 'Williams', '555-987-6543');

INSERT INTO Car (make, model, year, serial_number, salesperson_id, customer_id) VALUES
('Toyota', 'Corolla', 2020, 123456, 1, 1),
('Honda', 'Civic', 2019, 789012, 2, 2);

INSERT INTO Invoice (car_id, salesperson_id, customer_id, amount, date) VALUES
(3, 1, 1, 25000, '2024-04-10'),
(4, 2, 2, 20000, '2024-04-10');

INSERT INTO Mechanic (first_name, last_name, contact_number) VALUES
('Mike', 'Brown', '555-555-5555'),
('Sarah', 'Miller', '555-666-7777');

INSERT INTO Parts (name, description, quantity, price) VALUES
('Oil Filter', 'High-quality oil filter for car maintenance', 100, 10),
('Brake Pad', 'Set of brake pads for brake replacement', 50, 50);

INSERT INTO Service_Ticket (car_id, customer_id, mechanic_id, part_id, date) VALUES
(3, 1, 1, 1, '2024-04-11'),
(4, 2, 2, 2, '2024-04-12');

INSERT INTO Service_History (car_id, customer_id, service_details, service_date) VALUES
(3, 1, 'Oil Change', '2024-04-11'),
(4, 2, 'Brake Replacement', '2024-04-12');



-- Stored function to insert data into the Salesperson table
CREATE OR REPLACE FUNCTION insert_salesperson()
RETURNS VOID AS $$
BEGIN
    INSERT INTO Salesperson (first_name, last_name, contact_number) VALUES
    ('Emily', 'Jones', '555-777-8888'),
    ('Michael', 'Davis', '555-999-0000');
END;
$$ LANGUAGE plpgsql;

-- Calling the stored function, inserts data into the Salesperson table
SELECT insert_salesperson();
