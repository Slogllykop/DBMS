create table cir_area(
radius int,
area float);

DECLARE
radius int;
area float;
PI CONSTANT float := 3.1415;
BEGIN
radius := 5;
for i in 5..9
LOOP
area := PI * radius * radius;
INSERT into cir_area values(radius,area);
radius := radius + 1 ;
End LOOP;
end;
/