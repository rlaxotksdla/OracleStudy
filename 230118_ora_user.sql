CREATE TABLE ex2_4(
	col_float1 FLOAT(32),
	col_float2 FLOAT
	);
	
INSERT INTO ex2_4(
	col_float1,
	col_float2
	)
	VALUES(
	1234567891234,
	1234567891234
	);

SELECT *
FROM ex2_4;

CREATE TABLE ex2_5(
	col_date      DATE,
	col_timestamp TIMESTAMP
	);

INSERT INTO ex2_5 VALUES (sysdate, systimestamp);

SELECT *
FROM ex2_5;

CREATE TABLE ex2_6(
	col_null			VARCHAR2(10),
	col_not_null	VARCHAR2(10) NOT NULL
	);
	
--NULL »ðÀÔ ºÒ°¡´É
INSERT INTO ex2_6 VALUES('AA','');

INSERT INTO ex2_6 VALUES('AA','BB');

SELECT *
FROM ex2_6;

SELECT 
	constraint_name,
	constraint_type,
	table_name,
	search_condition
FROM user_constraints
Where table_name = 'EX2_6';
