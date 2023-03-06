-- triggers
CREATE TABLE trigger_test(
message VARCHAR(100)
);

DELIMITER $$
CREATE
	TRIGGER my_trigger1 BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
		INSERT INTO trigger_test VALUES ('new row inserted');
	END $$
DELIMITER ;

INSERT INTO employee VALUES(110,'vasu','shiva',NULL,NULL,NULL,NULL,NULL);

SELECT * FROM trigger_test;


DELIMITER $$
CREATE
	TRIGGER my_trigger2 BEFORE INSERT
	ON employee
    FOR EACH ROW BEGIN
		INSERT INTO trigger_test VALUES(NEW.first_name);
	END $$
DELIMITER ;

INSERT INTO employee VALUES(111,'Govinda','Govinda',NULL,NULL,NULL,NULL,NULL);

-- consitional triggers

DELIMITER $$
CREATE
	TRIGGER my_trigger3 BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
		IF NEW.sex = 'M' THEN
			INSERT INTO trigger_test VALUES ('added male employee');
		ELSEIF NEW.sex = 'F' THEN
			INSERT INTO trigger_test VALUES('added female employee');
		ELSE 
			INSERT INTO trigger_test VALUES('Added new employeeeeeee');
		END IF;
	END $$
DELIMITER ;

INSERT INTO employee VALUES(112,'Lakshmi','Lakshmi',NULL,'F',NULL,NULL,NULL);

DROP TRIGGER my_trigger1;
DROP TRIGGER my_trigger2;
DROP TRIGGER my_trigger3;