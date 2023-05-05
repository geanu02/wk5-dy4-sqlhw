-- FUNCTION --

-- Change the customer of a rental

SELECT *
FROM rental;

CREATE OR REPLACE FUNCTION change_customer(
	_rental_id INTEGER,
	new_customer INTEGER
)
RETURNS void AS $$
	BEGIN
		UPDATE rental
		SET customer_id = new_customer
		WHERE rental_id = _rental_id;
	END;
$$
LANGUAGE plpgsql;

SELECT *
FROM rental;

SELECT change_customer(11541, 341);


-- PROCEDURE --

-- Add a city name

SELECT *
FROM country;

SELECT *
FROM city;

CREATE OR REPLACE PROCEDURE new_city (
	_city_name VARCHAR(50),
	_country_id INTEGER
) AS $$ 
	BEGIN
		INSERT INTO city (
			city_name,
			country_id
		) VALUES (
			_city_name,
			_country_id
		);
		COMMIT;
	END;
$$
LANGUAGE plpgsql; 

CALL new_city('Manila', 75);