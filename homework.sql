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