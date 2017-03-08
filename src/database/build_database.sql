DROP TABLE IF EXISTS users cascade;

CREATE TABLE users (
  id TEXT PRIMARY KEY NOT NULL,
  given_names TEXT,
  family_name TEXT,
  birth_date DATE,
  phone_number BIGINT,
  photo BYTEA,
  admin BOOLEAN
);

INSERT INTO users (id, given_names, family_name, birth_date, phone_number, admin) VALUES ('xFv5nFhg74HjsolcjDeDDhhbvgcf08G9f4Xf1', 'Nori', 'Denes', '1/1/2000', 07123456789, false);
INSERT INTO users (id, given_names, family_name, birth_date, phone_number, admin) VALUES ('Re5xYlrYsu8ctaxPN2g7zZYGHSKOHotA6UYABPmadPvMaPs3ssziv0iEBd75zfi2', 'MARKO', 'SUSTARSIC', '1988-02-21', 447811110722, true);

SELECT * FROM users;

DROP TABLE IF EXISTS requests cascade;

CREATE TABLE requests (
  id SERIAL PRIMARY KEY NOT NULL,
  rental_reference BOOLEAN,
  rental_arrears BOOLEAN,
  rental_history BOOLEAN,
  other_requests TEXT,
  email TEXT,
  street TEXT,
  town TEXT,
  postcode TEXT,
  time_stamp TIMESTAMP WITH TIME ZONE,
  user_id TEXT REFERENCES users (id)
);

INSERT INTO requests (rental_reference, rental_arrears, rental_history, other_requests, email, street, town, postcode, time_stamp, user_id) VALUES (TRUE, FALSE, FALSE, 'also some other report', 'hello@gmail.com', NULL, NULL, NULL, current_timestamp, 'xFv5nFhg74HjsolcjDeDDhhbvgcf08G9f4Xf1');

SELECT * FROM requests;

COMMIT;
