create database cri_bet;
use cri_bet;
create table users(
orkut_id varchar(100) primary key,
opensocial_id varchar(100) unique,
name varchar(200),
register_time TIMESTAMP DEFAULT NOW()
)ENGINE=INNODB;

create table teams(
team_code varchar(5) primary key,
team_name varchar(200))ENGINE=INNODB;

create table players(
player_id integer auto_increment primary key,
name varchar(200),
team_code varchar(5),
FOREIGN KEY(team_code) REFERENCES teams(team_code) ON UPDATE CASCADE
)ENGINE=INNODB;

create table matches(
match_id integer auto_increment primary key,
team1 varchar(5),
team2 varchar(5),
schedule_time datetime,
location varchar(200),
FOREIGN KEY(team1) REFERENCES teams(team_code) ON UPDATE CASCADE,
FOREIGN KEY(team2) REFERENCES teams(team_code) ON UPDATE CASCADE
)ENGINE=INNODB;

create table questions(
qid integer auto_increment primary key,
question text
)ENGINE=INNODB;


create table choices(
choice_id integer auto_increment primary key,
qid integer,
match_id integer,
choice text,
FOREIGN KEY(qid) REFERENCES questions(qid) ON UPDATE CASCADE,
FOREIGN KEY(match_id) REFERENCES matches(match_id) ON UPDATE CASCADE
)ENGINE=INNODB;

create table user_bettings(
match_id integer,
qid integer,
user_id varchar(100),
user_choice varchar(100),
bet_amount integer(6),
bet_time TIMESTAMP DEFAULT NOW(),
FOREIGN KEY(match_id) REFERENCES matches(match_id) ON UPDATE CASCADE,
FOREIGN KEY(qid) REFERENCES questions(qid) ON UPDATE CASCADE,
FOREIGN KEY(user_id) REFERENCES users(orkut_id) ON UPDATE CASCADE,
primary key (match_id,qid,user_id)
)ENGINE=INNODB;

create table answers(
match_id integer,
qid integer,
answer varchar(100),
FOREIGN KEY(match_id) REFERENCES matches(match_id) ON UPDATE CASCADE,
FOREIGN KEY(qid) REFERENCES questions(qid) ON UPDATE CASCADE,
primary key(match_id,qid)
)ENGINE=INNODB;

insert into questions (question) values ('Who will win the match?');
insert into questions (question) values ('Who will be the man of the match?');

insert into teams values ('AUS','Australia');
insert into teams values ('BAN','Bangladesh');
insert into teams values ('ENG','England');
insert into teams values ('IND','India');
insert into teams values ('IRE','Ireland');
insert into teams values ('NZ','New Zealand');
insert into teams values ('NET','Netherlands');
insert into teams values ('PAK','Pakistan');
insert into teams values ('SCO','Scotland');
insert into teams values ('SA','South Africa');
insert into teams values ('SLA','Sri Lanka');
insert into teams values ('WI','West Indies');

insert into matches (team1,team2,schedule_time,location) values ('ENG','NET','2009-06-05 16:30:00','Lord\'s, London');
insert into matches (team1,team2,schedule_time,location) values ('NZ','SCO','2009-06-06 09:00:00','Kennington Oval, London');

insert into choices (qid,match_id,choice) values (1,1,'ENG');
insert into choices (qid,match_id,choice) values (1,1,'NET');
insert into choices (qid,match_id,choice) values (2,1,'Ravi Bopara');
insert into choices (qid,match_id,choice) values (2,1,'Andrew Flintoff');
insert into choices (qid,match_id,choice) values (2,1,'Kevin Pietersen');
insert into choices (qid,match_id,choice) values (2,1,'James Anderson');

insert into choices (qid,match_id,choice) values (1,2,'NZ');
insert into choices (qid,match_id,choice) values (1,2,'SCO');
insert into choices (qid,match_id,choice) values (2,2,'Brendon McCullum');
insert into choices (qid,match_id,choice) values (2,2,'Daniel Vettori');
insert into choices (qid,match_id,choice) values (2,2,'Ross Taylor');
insert into choices (qid,match_id,choice) values (2,2,'Jesse Ryder');



insert into players(name,team_code) values ('Ricky Ponting (captain)','AUS');
insert into players(name,team_code) values ('Michael Clarke (vice-captain)','AUS');
insert into players(name,team_code) values ('Nathan Bracken','AUS');
insert into players(name,team_code) values ('Brad Haddin','AUS');
insert into players(name,team_code) values ('Nathan Hauritz','AUS');
insert into players(name,team_code) values ('Ben Hilfenhaus','AUS');
insert into players(name,team_code) values ('James Hopes','AUS');
insert into players(name,team_code) values ('David Hussey','AUS');
insert into players(name,team_code) values ('Mike Hussey','AUS');
insert into players(name,team_code) values ('Mitchell Johnson','AUS');
insert into players(name,team_code) values ('Brett Lee','AUS');
insert into players(name,team_code) values ('Peter Siddle','AUS');
insert into players(name,team_code) values ('Andrew Symonds','AUS');
insert into players(name,team_code) values ('David Warner','AUS');
insert into players(name,team_code) values ('Shane Watson','AUS');
insert into players(name,team_code) values ('Mohammad Ashraful (capt)','BAN');
insert into players(name,team_code) values ('Mashrafe Mortaza','BAN');
insert into players(name,team_code) values ('Tamim Iqbal','BAN');
insert into players(name,team_code) values ('Junaid Siddique','BAN');
insert into players(name,team_code) values ('Raqibul Hasan','BAN');
insert into players(name,team_code) values ('Shakib Al Hasan','BAN');
insert into players(name,team_code) values ('Mushfiqur Rahim','BAN');
insert into players(name,team_code) values ('Naeem Islam','BAN');
insert into players(name,team_code) values ('Abdur Razzak','BAN');
insert into players(name,team_code) values ('Shahadat Hossain','BAN');
insert into players(name,team_code) values ('Syed Rasel','BAN');
insert into players(name,team_code) values ('Mohammad Mahmudullah','BAN');
insert into players(name,team_code) values ('Rubel Hossain','BAN');
insert into players(name,team_code) values ('Shamsur Rahman','BAN');
insert into players(name,team_code) values ('Mohammad Mithun','BAN');
insert into players(name,team_code) values ('Paul Collingwood (capt)','ENG');
insert into players(name,team_code) values ('James Anderson','ENG');
insert into players(name,team_code) values ('Ravi Bopara','ENG');
insert into players(name,team_code) values ('Stuart Broad','ENG');
insert into players(name,team_code) values ('Andrew Flintoff','ENG');
insert into players(name,team_code) values ('James Foster (wk)','ENG');
insert into players(name,team_code) values ('Rob Key','ENG');
insert into players(name,team_code) values ('Dimitri Mascarenhas','ENG');
insert into players(name,team_code) values ('Eoin Morgan','ENG');
insert into players(name,team_code) values ('Graham Napier','ENG');
insert into players(name,team_code) values ('Kevin Pietersen','ENG');
insert into players(name,team_code) values ('Owais Shah','ENG');
insert into players(name,team_code) values ('Ryan Sidebottom','ENG');
insert into players(name,team_code) values ('Graeme Swann','ENG');
insert into players(name,team_code) values ('Luke Wright','ENG');
insert into players(name,team_code) values ('Mahendra Singh Dhoni (captain)','IND');
insert into players(name,team_code) values ('Virender Sehwag (vice-captain)','IND');
insert into players(name,team_code) values ('Gautam Gambhir','IND');
insert into players(name,team_code) values ('Suresh Raina','IND');
insert into players(name,team_code) values ('Yuvraj Singh','IND');
insert into players(name,team_code) values ('Yusuf Pathan','IND');
insert into players(name,team_code) values ('Rohit Sharma','IND');
insert into players(name,team_code) values ('Harbhajan Singh','IND');
insert into players(name,team_code) values ('Zaheer Khan','IND');
insert into players(name,team_code) values ('Ishant Sharma','IND');
insert into players(name,team_code) values ('Praveen Kumar','IND');
insert into players(name,team_code) values ('R P Singh','IND');
insert into players(name,team_code) values ('Ravindra Jadeja','IND');
insert into players(name,team_code) values ('Pragyan Ojha','IND');
insert into players(name,team_code) values ('Irfan Pathan','IND');
insert into players(name,team_code) values ('William Porterfield (capt)','IRE');
insert into players(name,team_code) values ('Andre Botha','IRE');
insert into players(name,team_code) values ('Jeremy Bray','IRE');
insert into players(name,team_code) values ('Peter Connell','IRE');
insert into players(name,team_code) values ('Alex Cusack','IRE');
insert into players(name,team_code) values ('Trent Johnston','IRE');
insert into players(name,team_code) values ('Kyle McCallan','IRE');
insert into players(name,team_code) values ('John Mooney','IRE');
insert into players(name,team_code) values ('Kevin O\'Brien','IRE');
insert into players(name,team_code) values ('Niall O\'Brien (wk)','IRE');
insert into players(name,team_code) values ('Boyd Rankin','IRE');
insert into players(name,team_code) values ('Paul Stirling','IRE');
insert into players(name,team_code) values ('Regan West','IRE');
insert into players(name,team_code) values ('Andrew White','IRE');
insert into players(name,team_code) values ('Gary Wilson','IRE');
insert into players(name,team_code) values ('Brendon McCullum','NZ');
insert into players(name,team_code) values ('Martin Guptill','NZ');
insert into players(name,team_code) values ('Jesse Ryder','NZ');
insert into players(name,team_code) values ('Ross Taylor','NZ');
insert into players(name,team_code) values ('Scott Styris','NZ');
insert into players(name,team_code) values ('Neil Broom','NZ');
insert into players(name,team_code) values ('Jacob Oram','NZ');
insert into players(name,team_code) values ('James Franklin','NZ');
insert into players(name,team_code) values ('Nathan McCullum','NZ');
insert into players(name,team_code) values ('Daniel Vettori (capt)','NZ');
insert into players(name,team_code) values ('Ian Butler','NZ');
insert into players(name,team_code) values ('Peter McGlashan','NZ');
insert into players(name,team_code) values ('Kyle Mills','NZ');
insert into players(name,team_code) values ('Brendon Diamanti','NZ');
insert into players(name,team_code) values ('Iain O\'Brien','NZ');
insert into players(name,team_code) values ('Jeroen Smits (capt)','NET');
insert into players(name,team_code) values ('Peter Borren','NET');
insert into players(name,team_code) values ('Mudassar Buhkari','NET');
insert into players(name,team_code) values ('Tom De Grooth','NET');
insert into players(name,team_code) values ('Maurits Jonkman','NET');
insert into players(name,team_code) values ('Alexei Kervezee','NET');
insert into players(name,team_code) values ('Dirk Nannes','NET');
insert into players(name,team_code) values ('Ruud Nijman','NET');
insert into players(name,team_code) values ('Darren Reekers','NET');
insert into players(name,team_code) values ('Edgar Schiferli','NET');
insert into players(name,team_code) values ('Pieter Seelaar','NET');
insert into players(name,team_code) values ('Eric Szwarczynski','NET');
insert into players(name,team_code) values ('Ryan ten Doeschate','NET');
insert into players(name,team_code) values ('Dan van Bunge','NET');
insert into players(name,team_code) values ('Bas Zuiderent','NET');
insert into players(name,team_code) values ('Younis Khan (captain)','PAK');
insert into players(name,team_code) values ('Salman Butt','PAK');
insert into players(name,team_code) values ('Ahmed Shahzad','PAK');
insert into players(name,team_code) values ('Misbah-ul-Haq','PAK');
insert into players(name,team_code) values ('Kamran Akmal','PAK');
insert into players(name,team_code) values ('Fawad Alam','PAK');
insert into players(name,team_code) values ('Shoaib Malik','PAK');
insert into players(name,team_code) values ('Shahid Afridi','PAK');
insert into players(name,team_code) values ('Sohail Tanvir','PAK');
insert into players(name,team_code) values ('Yasir Arafat','PAK');
insert into players(name,team_code) values ('Shoaib Akhter','PAK');
insert into players(name,team_code) values ('Umar Gul','PAK');
insert into players(name,team_code) values ('Mohammad Aamir','PAK');
insert into players(name,team_code) values ('Saeed Ajmal','PAK');
insert into players(name,team_code) values ('Shazaib Hassan','PAK');
insert into players(name,team_code) values ('Gavin Hamilton (captain)','SCO');
insert into players(name,team_code) values ('Richie Berrington','SCO');
insert into players(name,team_code) values ('John Blain','SCO');
insert into players(name,team_code) values ('Kyle Coetzer','SCO');
insert into players(name,team_code) values ('Gordon Drummond','SCO');
insert into players(name,team_code) values ('Majid Haq','SCO');
insert into players(name,team_code) values ('Neil McCallum','SCO');
insert into players(name,team_code) values ('Navdeep Poonia','SCO');
insert into players(name,team_code) values ('Dewald Nel','SCO');
insert into players(name,team_code) values ('Glenn Rogers','SCO');
insert into players(name,team_code) values ('Colin Smith','SCO');
insert into players(name,team_code) values ('Jan Stander','SCO');
insert into players(name,team_code) values ('Fraser Watts','SCO');
insert into players(name,team_code) values ('Ryan Watson','SCO');
insert into players(name,team_code) values ('Craig Wright','SCO');
insert into players(name,team_code) values ('Graeme Smith (capt)','SA');
insert into players(name,team_code) values ('Johan Botha','SA');
insert into players(name,team_code) values ('Yusuf Abdulla','SA');
insert into players(name,team_code) values ('Mark Boucher (wk)','SA');
insert into players(name,team_code) values ('AB de Villiers','SA');
insert into players(name,team_code) values ('JP Duminy','SA');
insert into players(name,team_code) values ('Herschelle Gibbs','SA');
insert into players(name,team_code) values ('Jacques Kallis','SA');
insert into players(name,team_code) values ('Albie Morkel','SA');
insert into players(name,team_code) values ('Morne Morkel','SA');
insert into players(name,team_code) values ('Justin Ontong','SA');
insert into players(name,team_code) values ('Wayne Parnell','SA');
insert into players(name,team_code) values ('Robbie Peterson','SA');
insert into players(name,team_code) values ('Dale Steyn','SA');
insert into players(name,team_code) values ('Roelof van der Merwe','SA');
insert into players(name,team_code) values ('Kumar Sangakkara (capt & wk)','SLA');
insert into players(name,team_code) values ('Muttiah Muralitharan','SLA');
insert into players(name,team_code) values ('Sanath Jayasuriya','SLA');
insert into players(name,team_code) values ('T.M. Dilshan','SLA');
insert into players(name,team_code) values ('Mahela Jayawardene','SLA');
insert into players(name,team_code) values ('Chamara Silva','SLA');
insert into players(name,team_code) values ('Angelo Mathews','SLA');
insert into players(name,team_code) values ('Ajantha Mendis','SLA');
insert into players(name,team_code) values ('Nuwan Kulasekara','SLA');
insert into players(name,team_code) values ('Thilan Thushara','SLA');
insert into players(name,team_code) values ('Lasith Malinga','SLA');
insert into players(name,team_code) values ('Isuru Udana','SLA');
insert into players(name,team_code) values ('Farveez Maharoof','SLA');
insert into players(name,team_code) values ('Jehan Mubarak','SLA');
insert into players(name,team_code) values ('Indika de Saram','SLA');
insert into players(name,team_code) values ('Chris Gayle (capt)','WI');
insert into players(name,team_code) values ('Denesh Ramdin (wk)','WI');
insert into players(name,team_code) values ('Lionel Baker','WI');
insert into players(name,team_code) values ('Sulieman Benn','WI');
insert into players(name,team_code) values ('David Bernard.','WI');
insert into players(name,team_code) values ('Dwayne Bravo','WI');
insert into players(name,team_code) values ('Shivnarine Chanderpaul','WI');
insert into players(name,team_code) values ('Fidel Edwards','WI');
insert into players(name,team_code) values ('Andre Fletcher','WI');
insert into players(name,team_code) values ('Xavier Marshall','WI');
insert into players(name,team_code) values ('Kieron Pollard','WI');
insert into players(name,team_code) values ('Darren Sammy','WI');
insert into players(name,team_code) values ('Ramnaresh Sarwan','WI');
insert into players(name,team_code) values ('Lendl Simmons','WI');
insert into players(name,team_code) values ('Jerome Taylor','WI');
