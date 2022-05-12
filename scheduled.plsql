
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
INSERT INTO scheduled
VALUES('ACCT291', 'Spring2021', 1,
       TO_DSINTERVAL('0 09:55:00'), TO_DATE('May 04', 'Month DD'));
INSERT INTO scheduled
VALUES('ACCT291', 'Spring2021', 2,
       TO_DSINTERVAL('0 09:55:00'), TO_DATE('May 06', 'Month DD'));
INSERT INTO scheduled
VALUES('ACCT291', 'Spring2021', 3,
       TO_DSINTERVAL('0 14:45:00'), TO_DATE('May 04', 'Month DD'));
INSERT INTO scheduled
VALUES('ACCT371', 'Spring2021', 1,
       TO_DSINTERVAL('0 09:55:00'), TO_DATE('May 04', 'Month DD'));
INSERT INTO scheduled
VALUES('CSCI300', 'Spring2021', 2,
       TO_DSINTERVAL('0 19:45:00'), TO_DATE('May 04', 'Month DD'));
