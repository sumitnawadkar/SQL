create database ICC_Tournament_Events;
create table Asia_Cup_Winners
(ID int primary key, `year` int, Host_name varchar(10), Final_venue varchar(10),
 winner varchar(10), Result int, Final_match_date date);
 insert into Asia_Cup_Winners
 (ID, `year`,  Host_name, Final_venue, winner, Result, Final_match_date)
 values(1, 1984, "UAE", "Sharjah", "India", 54, "1984-04-13"),
       (3, 1988, "Bangladesh", "Dhaka", "India", 6, "1988-11-04"),
       (4, 1991, "India", "Kolkata", "India", 7, "1991-01-04"),
       (6, 1997, "Sri lanka", "Colombo", "Sri lanka", 8, "1997-07-26"),
       (8, 2004, "Sri lanka", "Colombo", "Sri lanka", 25, "2004-08-01"),
       (9, 2008, "Pakistan", "Karachi", "Sri lanka", 100, "2008-07-06"),
       (10, 2010, "Sri lanka", "Dambulla", "India", 81, "2010-06-24");
select*from Asia_Cup_Winners;
       
 create table Cricket_WC_Winners
(ID int primary key, `year`int, Host_name varchar(20), Winner varchar(10), Result int, Match_date date);
 insert into Cricket_WC_Winners
(ID, `year`, Host_name, Winner, Result, Match_date)
 values (1, "1983", "England", "India", "43", "1983-6-25"),
        (2, "1987", "India", "Australia", "7", "1987-11-8"),
        (4, "1996", "India", "Sri lanka", "7", "1996-03-17"),
        (5, "1999", "England", "Australia", "8", "1999-06-20"),
        (6, "2003", "South africa", "Australia", "125", "2003-03-23"),
        (7, "2011", "India", "India", "6", "2011-03-23");
select*from Cricket_WC_Winners;
	
create table T20_WC_Winners
(ID int primary key, winner_Team varchar(20), `year`int, Result int, POS varchar(20), Venue varchar(20));
insert into T20_WC_Winners
(ID,  winner_Team, `year`, Result, POS, Venue)
values(1, "India", 2007, 5, "Shahid Afridi", "South Africa"),
      (3, "England", 2010, 7, "Kevin Pietersen", "West Indies"),
      (4, "West Indies", 2012, 36, "Shane Watson", "Sri Lanka"),
      (5, "Sri Lanka", 2014, 6, "Virat Kohli", "Bangladesh"),
      (7, "Australia", 2021, 8, "David Warner", "UAE,Oman"),
      (8, "England", 2022, 5, "Sam Curran", "Australia");
select*from T20_WC_Winners;

-- Display the Final venue of Asia cup winners where result is greater than 10;
select count(Final_venue)from Asia_Cup_Winners
where result>10;

-- Calculate the `year` by using group by and arrange it into descending.;
select Result, sum(`year`) 
from Asia_Cup_Winners
group by result
order by sum(`year`) desc;

select count(Result) from Asia_Cup_Winners
group by Result
order by count(Result) desc;

select length(`POS`) from t20_wc_winners;

-- calculate the result of  cricket_wc_winners;
select sum(result) from cricket_wc_winners;

-- To display the winner name with year.; 
select concat(winner_team, ' ', `year` ) as result from t20_wc_winners;
select Result from t20_wc_winners
where winner_Team = "West Indies";

select `year`, count(Winner) from asia_cup_winners
where winner = 'India'
group by `year`
order by `year`desc;

-- To display the host name where sum of result is greater than 60;
select Host_name, sum(Result) from asia_cup_winners
group by Host_name
having sum(Result)>60;

-- To display the Host name which has 2nd last letter is ‘a’ and also count the Host name;
select Host_name,count(Host_name) from asia_cup_winners
where Host_name like "%a_"
group by Host_name;

-- Display the position of occurrence of string ‘ratne’ in the string ‘Tillakaratne Dilshan.;
select position("Pieter" in "Kevin Pietersen");

-- To display the winner of cricket_wc_winners and asia_cup_winners;
select asia_cup_winners.id, asia_cup_winners.winner from asia_cup_winners left join cricket_wc_winners 
on asia_cup_winners.ID= cricket_wc_winners.ID
order by (id) desc;

select*from asia_cup_winners cross join t20_wc_winners
on asia_cup_winners.ID= t20_wc_winners.ID;

-- To display the winner team, Result and POS of t20_wc_winners with descending order result.;
select t20_wc_winners.winner_Team, t20_wc_winners.Result, t20_wc_winners.`year`from t20_wc_winners cross join cricket_wc_winners
on t20_wc_winners.ID= cricket_wc_winners.ID
order by (result) desc;

select asia_cup_winners.ID, asia_cup_winners.`year`, asia_cup_winners.Host_name from asia_cup_winners inner join t20_wc_winners
on asia_cup_winners.ID = t20_wc_winners.ID
order by (Id) desc;

select winner, result from cricket_wc_winners
where result = (select max(result) from cricket_wc_winners );

select a.Final_match_date, sum(result) from asia_cup_winners a inner join cricket_wc_winners c
on a.'ID' = c.'ID'
group by a.final_match_date
order by sum(c.result);

-- To display the result of asia cup winners which is greater than 10 ;
select*from asia_cup_winners where Result in (select Result from asia_cup_winners
where result >10);