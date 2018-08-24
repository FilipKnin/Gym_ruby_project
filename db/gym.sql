DROP TABLE IF EXISTS gyms;
DROP TABLE IF EXISTS gymclasses;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS personaltrainers;

CREATE TABLE personaltrainers(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  description TEXT
  );

CREATE TABLE members(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  phone VARCHAR(255) NOT NULL,
  DOB date NOT NULL,
  premium BOOLEAN
);

CREATE TABLE gymclasses(
  id SERIAL8 PRIMARY KEY,
  pt_id INT8 REFERENCES personaltrainers(id),
  name VARCHAR(255),
  capacity INT,
  day VARCHAR,
  hour time
);

CREATE TABLE gyms(
  id SERIAL8 PRIMARY KEY,
  gymclasses_id INT8 REFERENCES gymclasses(id) ON DELETE CASCADE,
  member_id INT8 REFERENCES members(id) ON DELETE CASCADE,
  regular_price INT,
  premium_price INT
)
