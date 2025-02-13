CREATE TABLE services (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE countries (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE hotels (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    country_id INT REFERENCES countries(id) ON DELETE CASCADE
);

CREATE INDEX idx_hotels_country_id ON hotels(country_id);

CREATE TABLE clients (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE
);

CREATE TABLE tours (
    id SERIAL PRIMARY KEY,
    client_id INT REFERENCES clients(id) ON DELETE CASCADE,
    service_id INT REFERENCES services(id) ON DELETE CASCADE,
    country_id INT REFERENCES countries(id) ON DELETE CASCADE,
    hotel_id INT REFERENCES hotels(id) ON DELETE SET NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    status VARCHAR(50) CHECK (status IN ('Забронирован', 'Оплачен', 'Отменен')) NOT NULL
);

CREATE INDEX idx_tours_client_id ON tours(client_id);
CREATE INDEX idx_tours_service_id ON tours(service_id);
CREATE INDEX idx_tours_country_id ON tours(country_id);
CREATE INDEX idx_tours_start_date ON tours(start_date);
