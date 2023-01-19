CREATE TABLE ex2_7(
	col_unique_null VARCHAR2(10) UNIQUE,
	col_unique_not_null VARCHAR2(10) NOT NULL UNIQUE,
	col_unique VARCHAR2(10),
	CONSTRAINTS unique_nm1 UNIQUE (col_unique)
	);
	
SELECT
	constraint_name,
	constraint_type,
	table_name,
	search_condition
FROM user_constraints
WHERE table_name = 'EX2_7';

--PRIMARY KEY(NOT NULL + UNIQUE)
CREATE TABLE ex2_8(
	col1 VARCHAR2(10) PRIMARY KEY,
	col2 VARCHAR2(10)
);

SELECT
	constraint_name,
	constraint_type,
	table_name,
	search_condition
FROM user_constraints
WHERE table_name = 'EX2_8';

--PRIMARY KEY에 null 삽입 불가능
INSERT INTO ex2_8
	VALUES('', 'AA'); 
	
INSERT INTO ex2_8
	VALUES('AA', 'AA');
	
--FOREIGN KEY(참조키) 참조할 키가 있는 테이블은 먼저 생성되어있어야하고 해당 테이블에서 PRIMARY KEY로 지정되어있어야함
/*
CONSTRAINT [외래키 명] FOREIGN KEY(컬럼명, ...)
REFERENCES [참조 테이블](참조 테이블 컬럼명, ...)
*/

--CHECK 컬럼에 입력하는 데이터를 체크해 특정 조건에 맞을때만 입력받고 아니면 오류
CREATE TABLE ex2_9(
	num1 NUMBER
	CONSTRAINTS check1 CHECK(num1 BETWEEN 1 AND 9),
	gender VARCHAR2(10)
	CONSTRAINTS check2 CHECK (gender IN ('MALE', 'FEMALE'))
	);
	
SELECT
	constraint_name,
	constraint_type,
	table_name,
	search_condition
FROM user_constraints
WHERE table_name = 'EX2_9';

INSERT INTO ex2_9
	VALUES(1, 'MALE');
	
SELECT *
FROM ex2_9;

--DEFAULT로 항상 입력될 데이터 적용가능
CREATE TABLE ex2_10(
	col1 VARCHAR2(10) NOT NULL,
	col2 VARCHAR2(20) NULL,
	create_date DATE DEFAULT sysdate
	);
	
SELECT
	constraint_name,
	constraint_type,
	table_name,
	search_condition
FROM user_constraints
WHERE table_name = 'EX2_10';

INSERT INTO ex2_10
	(col1, col2)
	VALUES('AA','BB');

SELECT *
FROM ex2_10;

DROP TABLE ex2_10;

CREATE TABLE ex2_10(
	col1 VARCHAR2(10) NOT NULL,
	col2 VARCHAR2(20) NULL,
	create_date DATE DEFAULT sysdate
	);
	
--ALTER 를 이용해 컬럼명 변경
ALTER TABLE ora_user.ex2_10
RENAME COLUMN col1 TO col11;

SELECT *
FROM ex2_10;

--ALTER 를 이용해 컬럼 타입 변경
ALTER TABLE ex2_10
MODIFY col2 VARCHAR(30);

DESC ex2_10;

--ALTER 를 이용해 컬럼 추가
ALTER TABLE ex2_10
ADD col3 NUMBER;

DESC ex2_10;

--ALTER 컬럼 삭제
ALTER TABLE ex2_10
	DROP COLUMN col3;

--ALTER 제약조건 삭제
ALTER TABLE ex2_10
	ADD CONSTRAINTS pk_ex2_10
		PRIMARY KEY (col11);

--ALTER 
ALTER TABLE ex2_10
DROP CONSTRAINTS pk_ex2_10;

--VIEW 생성 원본 데이터 변경시 수정된 결과로 보여줌
CREATE OR REPLACE VIEW emp_dept_v1 AS
SELECT 
	a.employee_id,
	a.emp_name,
	a.department_id,
	b.department_name
FROM 
	employees a,
	departments b
WHERE a.department_id = b.department_id;

SELECT *
FROM emp_dept_v1;

