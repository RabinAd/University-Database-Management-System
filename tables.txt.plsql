CREATE TABLE ParkingLot(
        lotNumber INTEGER,
        psize INTEGER,
        primary key(lotNumber)
);

CREATE TABLE ROOM(
        roomNUMBER INTEGER,
        buildingNAME CHAR(25),
        seats INTEGER,
        PRIMARY KEY(roomNUMBER, buildingNAME)
);

CREATE TABLE final_exam(
        etime INTERVAL DAY(0) TO SECOND(0),
        edate DATE,
        PRIMARY KEY (etime, edate)
);

Create Table Organization(
o_id VARCHAR(50),
name VARCHAR(50),
PRIMARY KEY(o_id)
);

CREATE TABLE course(
	cid VARCHAR(10),
	semester VARCHAR(20),
	start_time INTERVAL DAY(0) TO SECOND(0),
        end_time INTERVAL DAY(0) TO SECOND(0),
        start_date DATE,
        end_date DATE,
        section INTEGER,
        PRIMARY KEY (cid, semester, section)
);

CREATE TABLE Person(
        pid INTEGER,
        person_name VARCHAR(20),
        email VARCHAR (50),
        PRIMARY KEY(pid)
);

CREATE TABLE Faculty(
        pid INTEGER,
        dept_id INTEGER,
        dept_name CHAR(20),
        PRIMARY KEY(pid),
        FOREIGN KEY(pid) REFERENCES Person(pid)
);

Create Table Student(
pid INTEGER,
major VARCHAR(50),
gpa REAL,
outstanding_balance REAL,
PRIMARY KEY(pid),
FOREIGN KEY(pid) REFERENCES person(pid)
);

Create Table Volunteer_at(
pid INTEGER,
o_id VARCHAR(50),
hours REAL,
start_date DATE,
PRIMARY KEY(pid, o_id),
FOREIGN KEY(pid) References Student(pid),
FOREIGN KEY(o_id) References Organization(o_id)
);

CREATE TABLE scheduled(
        cid VARCHAR(10),
        semester varchar(20),
        section INTEGER,
        FOREIGN KEY (cid, semester, section)
                REFERENCES course(cid, semester, section),
        etime INTERVAL DAY(0) TO SECOND(0),
        edate DATE,
        FOREIGN KEY (etime, edate) REFERENCES final_exam(etime, edate),
        PRIMARY KEY (cid, semester, etime, edate),
        UNIQUE (cid, semester, section)
);

CREATE TABLE Teaches(
        pid INTEGER,
        cid VARCHAR(10),
        semester VARCHAR(20),
        section INTEGER,
        PRIMARY KEY(pid,cid,semester,section),
        FOREIGN KEY (pid) REFERENCES Faculty(pid),
        FOREIGN KEY (cid,semester,section)
            REFERENCES course(cid, semester,section)
);

CREATE TABLE LOCATION(
        cid VARCHAR(10),
        semester varchar(20),
        section INTEGER,
        roomNUMBER INTEGER,
        buildingNAME CHAR(25),
        PRIMARY KEY (cid, semester, section, roomNUMBER, buildingNAME),
        FOREIGN KEY (cid, semester, section)
                REFERENCES Course (cid, semester, section),
        FOREIGN KEY (roomNUMBER, buildingNAME)
                REFERENCES ROOM (roomNUMBER, buildingNAME)
);

CREATE TABLE ParksAt(
pid INTEGER,
lotNumber INTEGER,
primary key(pid, lotNumber),
FOREIGN KEY(pid) REFERENCES Person(pid)
);

CREATE TABLE Register(
cid varchar(10),
semester varchar(20),
section INTEGER,
pid INTEGER,
grade REAL,
primary key(cid, semester, section, pid),
foreign key(pid) references Student(pid),
foreign key(cid, semester, section)
    references course(cid, semester, section)
);
