create table customers(
ID INTEGER PRIMARY KEY,
name VARCHAR(20),
address VARCHAR(30),
salary NUMBER);

set serveroutput on;
CREATE or REPLACE TRIGGER cal_saldiff 
BEFORE INSERT or UPDATE or DELETE on customers
for EACH ROW
DECLARE
sal_diff NUMBER;
BEGIN
sal_diff := 0;
IF inserting THEN
 sal_diff := :NEW.salary;
end IF;
IF updating THEN
sal_diff := :NEW.salary - :OLD.salary ;
end IF;
IF deleting THEN
sal_diff := :OLD.salary;
end IF;
dbms_output.put_line('Salary difference is : ' || sal_diff);
END cal_saldiff;
/