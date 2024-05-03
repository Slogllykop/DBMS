create table Emp(
Emp_no NUMBER PRIMARY KEY,
Emp_name VARCHAR(30)NOT NULL,
Emp_salary NUMBER);

create table Tracking(
Emp_no NUMBER PRIMARY KEY,
Emp_salary NUMBER);

SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER Track_Emp 
BEFORE DELETE OR INSERT OR UPDATE ON Emp
FOR EACH ROW
BEGIN
IF(:NEW.emp_salary<50000) THEN
RAISE_APPLICATION_ERROR( -20001, 'LOW SALARY ERROR! Salary is less than 50000, try again' );
ELSE
INSERT INTO Tracking VALUES(:NEW.Emp_no,:NEW.Emp_salary);
END IF;
END Track_Emp;
/ 
