/*Question - 1*/
create table passenger (Passenger_name varchar(60), Category varchar(60), Gender varchar (30), Boarding_City varchar(60),Destination_City varchar(60), Distance int, Bus_Type varchar(60));
select * from passenger;
insert into passenger values ("Sejal", "AC", "F", "Bengaluru", "Chennai",350, "Sleeper");
insert into passenger values("Anmol","Non-AC","M","Mumbai","Hyderabad",700,"Sitting");
insert into passenger values("Pallavi","AC","F","Panaji","Bengaluru",600,"Sleeper");
insert into passenger values("Khusboo","AC","F","Chennai","Mumbai",1500,"Sleeper");
insert into passenger values("Udit","Non-AC","M","Trivandrum","panaji",1000,"Sleeper");
insert into passenger values("Ankur","AC","M","Nagpur","Hyderabad",500,"Sitting");
insert into passenger values("Hemant","Non-AC","M","panaji","Mumbai",700,"Sleeper");
insert into passenger values("Manish","Non-AC","M","Hyderabad","Bengaluru",500,"Sitting");
insert into passenger values("Piyush","AC","M","Pune","Nagpur",700,"Sitting");


/*Question - 2*/
create table price (Bus_Type varchar(60), Distance int, price int);
select * from price;
insert into price values ("Sleeper",350,770);
insert into price values ("Sleeper",500,1100);
insert into price values ("Sleeper",600,1320);
insert into price values ("Sleeper",700,1540);
insert into price values ("Sleeper",1000,2200);
insert into price values ("Sleeper",1200,2640);
insert into price values ("Sleeper",350,434);
insert into price values ("Sitting",500,620);
insert into price values ("Sitting",500,620);
insert into price values ("Sitting",600,744);
insert into price values ("Sitting",700,868);
insert into price values ("Sitting",1000,1240);
insert into price values ("Sitting",1200,1488);
insert into price values ("Sitting",1500,1860);


/*Question - 3*/
select * from passenger where Distance >= 600;


/*Question - 4*/
select min(price) as min_price from price; 


/*Question - 5*/
select * from passenger where passenger_name like 'S%';


/*Question - 6*/
select table1.Passenger_name, table1.Boarding_City, table1.Destination_City, table1.Bus_Type, max(table1.price) from (select passenger.Passenger_name, passenger.Boarding_City, passenger.Destination_City, passenger.Bus_Type, price.price
from passenger join price
where passenger.Distance = price.Distance and passenger.Bus_Type = price.Bus_Type) as table1 group by table1.passenger_name;


/*Question - 7*/
select * from (select passenger.Passenger_name, table1.Distance, table1.price
from passenger left join (select * from price where Bus_Type = 'Sitting' group by Distance) as table1 on passenger.Distance = table1.Distance) as table2
where Distance = 1000;


/*Question - 8*/
select price.Bus_Type, price.Distance, price.price from price right join (select Distance from passenger where Passenger_name = 'Pallavi') as table1 on table1.distance = price.distance;


/*Question - 9*/
select Distance from passenger group by Distance;


/*Question - 10*/
select passenger_name, (distance*100)/6550 as percentage_of_distance from passenger; 


/*Question - 11*/
/*****************PLEASE CHECK STORED PROCEDURE*************/
/*CREATE DEFINER=`root`@`localhost` PROCEDURE `11)Stored_procedure`()
BEGIN
	SELECT Distance, price,
	CASE
		WHEN price > 1000 THEN 'EXPENSIVE'
		WHEN price < 1000 AND price > 500 THEN 'AVERAGE COST'
		ELSE 'CHEAP'
	END AS Price_Category
	FROM price;	    
END*/
	
