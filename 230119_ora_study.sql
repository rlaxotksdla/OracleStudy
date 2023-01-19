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

--PRIMARY KEY�� null ���� �Ұ���
INSERT INTO ex2_8
	VALUES('', 'AA'); 
	
INSERT INTO ex2_8
	VALUES('AA', 'AA');
	
--FOREIGN KEY(����Ű) ������ Ű�� �ִ� ���̺��� ���� �����Ǿ��־���ϰ� �ش� ���̺��� PRIMARY KEY�� �����Ǿ��־����
/*
CONSTRAINT [�ܷ�Ű ��] FOREIGN KEY(�÷���, ...)
REFERENCES [���� ���̺�](���� ���̺� �÷���, ...)
*/

--CHECK �÷��� �Է��ϴ� �����͸� üũ�� Ư�� ���ǿ� �������� �Է¹ް� �ƴϸ� ����
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

--DEFAULT�� �׻� �Էµ� ������ ���밡��
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
	
--ALTER �� �̿��� �÷��� ����
ALTER TABLE ora_user.ex2_10
RENAME COLUMN col1 TO col11;

SELECT *
FROM ex2_10;

--ALTER �� �̿��� �÷� Ÿ�� ����
ALTER TABLE ex2_10
MODIFY col2 VARCHAR(30);

DESC ex2_10;

--ALTER �� �̿��� �÷� �߰�
ALTER TABLE ex2_10
ADD col3 NUMBER;

DESC ex2_10;

--ALTER �÷� ����
ALTER TABLE ex2_10
	DROP COLUMN col3;

--ALTER �������� ����
ALTER TABLE ex2_10
	ADD CONSTRAINTS pk_ex2_10
		PRIMARY KEY (col11);

--ALTER 
ALTER TABLE ex2_10
DROP CONSTRAINTS pk_ex2_10;

--VIEW ���� ���� ������ ����� ������ ����� ������
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

