CREATE TABLE customers(customer_id SERIAL PRIMARY KEY, name VARCHAR(60) NOT NULL, phone VARCHAR(40) UNIQUE NOT NULL);
CREATE TABLE services(service_id SERIAL PRIMARY KEY, name VARCHAR(40) NOT NULL UNIQUE);
CREATE TABLE appointments(appointment_id SERIAL PRIMARY KEY, time VARCHAR(40) NOT NULL, customer_id INT NOT NULL, service_id INT NOT NULL);

ALTER TABLE appointments ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id);
ALTER TABLE appointments ADD FOREIGN KEY (service_id) REFERENCES services(service_id);

INSERT INTO services(name) VALUES ('cut'),('color'), ('perm'), ('style'), ('trim');
