--CREATE FUNCTION <FUNCTION_NAME> (
--	param1 <DATA TYPE>,
--	param2 <DATA TYPE>
--)
--RETURNS <RETURN value DATA TYPE> AS 
--$$
--	FUNCTION body;
--$$
--LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION double_num (
	num INTEGER
)
RETURNS INTEGER AS
$$
	BEGIN
	RETURN num * 2;
	END;
$$
LANGUAGE plpgsql;

SELECT double_num(5);

SELECT *
FROM payment;

DROP FUNCTION add_late_fee;
CREATE OR REPLACE FUNCTION ADD_late_fee(
	_payment_id INTEGER,
	_customer_id INTEGER,
	late_fee_amount NUMERIC(4, 2)
)
RETURNS void AS
$$
	BEGIN
	UPDATE payment
	SET amount = amount + late_fee_amount
	WHERE payment_id = _payment_id AND customer_id = _customer_id;
	END;
$$
LANGUAGE plpgsql;

SELECT *
FROM payment;

SELECT add_late_fee(17504, 341, 1.00);

SELECT *
FROM ACTOR
WHERE last_name = 'Witherspoon';
-- actor_id = 144

CREATE OR REPLACE FUNCTION actor_first_name(
	_actor_id INTEGER,
	new_first_name VARCHAR(50)
)
RETURNS VOID AS
$$
	BEGIN
	UPDATE actor
	SET first_name = new_first_name
	WHERE actor_id = _actor_id;
	END;	
$$
LANGUAGE plpgsql;

SELECT actor_first_name(144, 'Reese');

SELECT *
FROM actor
WHERE actor_id = 144;

SELECT *
FROM rental 
WHERE return_date IS NULL;

CREATE OR REPLACE PROCEDURE update_return_date(
	_rental_id INTEGER,
	_customer_id INTEGER
)
AS $$
	BEGIN
		UPDATE rental
		SET return_date = current_date
		WHERE rental_id = _rental_id AND customer_id = _customer_id;
		COMMIT;
	END;
	
$$
LANGUAGE plpgsql;

CALL update_return_date(11541, 335);

SELECT * 
FROM rental
WHERE rental_id = 11541;

SELECT *
FROM actor;

CREATE OR REPLACE PROCEDURE add_actor (
	_first_name VARCHAR(50),
	_last_name VARCHAR(50)
) AS $$ 
	BEGIN
		INSERT INTO actor (
			first_name,
			last_name
		) VALUES (
			_first_name,
			_last_name
		);
		COMMIT;
	END;
$$
LANGUAGE plpgsql; 

CALL add_actor('Cindy', 'Crawford');


CREATE OR REPLACE PROCEDURE remove_inventory (
	_inventory_id integer,
	_film_id integer
)
LANGUAGE plpgsql
AS $$
	BEGIN 
		UPDATE rental 
		SET inventory_id = Null
		WHERE inventory_id = _inventory_id;
		DELETE FROM inventory 
		WHERE inventory_id = _inventory_id AND film_id = _film_id;
	COMMIT;
	END;
$$

alter table rental alter column inventory_id drop not NULL;

SELECT *
FROM inventory;

CALL remove_inventory(3,1);