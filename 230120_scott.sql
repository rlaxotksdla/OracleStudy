SELECT CONCAT(empno || mgr || ename, deptno)
FROM emp;

SELECT TO_DATE('2023-01-20','yyyy-mm-dd')
FROM dual;

SELECT NVL(comm, 0)
FROM emp;

SELECT
	e.ename,
	e.sal * 12 + NVL(e.comm, 0) AS year_sal
FROM emp e;

SELECT
	COUNT(*) AS member_count,
	SUM(sal) AS total_sal,
	MAX(sal) AS highest_sal
FROM emp;

SELECT
	e.ename
FROM emp e
WHERE e.sal = (
							 SELECT MAX(sal)
							 FROM emp
							 );

SELECT
	e.deptno,
	e.ename
FROM emp e
WHERE e.sal IN (
								SELECT MAX(e.sal)
								FROM emp e
								GROUP BY e.deptno
								);
								
SELECT e.ename
FROM emp e
WHERE
	e.comm IS NULL
	OR e.comm = 0; 
	
SELECT ROUND(AVG(e.sal), 2)
FROM emp e
WHERE e.deptno = 30;

SELECT
	e.deptno,
	ROUND(AVG(e.sal), 2)
FROM emp e
GROUP BY e.deptno;

SELECT
	e.deptno,
	ROUND(AVG(e.sal), 2)
FROM emp e
WHERE e.sal <= 4000
GROUP BY e.deptno
	HAVING ROUND(AVG(e.sal), 2) >= 2000;

SELECT
	e.*,
	d.dname,
	d.loc
FROM
	emp e,
	dept d
WHERE e.deptno = d.deptno;

SELECT
	e.empno,
	e.ename,
	d.dname,
	d.loc
FROM
	emp e,
	dept d
WHERE e.deptno = d.deptno;

SELECT
	e.*,
	s.*
FROM
	emp e,
	salgrade s
WHERE e.sal BETWEEN s.losal AND s.hisal;

SELECT
	e1.empno,
	e1.ename,
	e2.ename
FROM
	emp e1,
	emp e2
WHERE e1.mgr = e2.empno;

SELECT *
FROM emp_temp;

CREATE TABLE emp_alter
	AS SELECT * FROM emp;
	
SELECT * FROM emp_alter;

ALTER TABLE emp_ALTER
	ADD hp VARCHAR2(20);
	
SELECT * FROM emp_alter;

ALTER TABLE emp_alter
	RENAME COLUMN hp TO tel;
	
ALTER TABLE emp_alter
MODIFY empno NUMBER(5);

desc emp;

CREATE TABLE emp_rename
	AS SELECT * FROM emp;
	
TRUNCATE TABLE emp_rename;

SELECT * FROM emp_rename;

DROP TABLE emp_rename;

CREATE TABLE emp_hw(
	empno NUMBER(4),
	ename VARCHAR2(10),
	job VARCHAR2(9),
	mgr NUMBER(4),
	hiredate DATE,
	sal NUMBER(7, 2),
	comm NUMBER(7, 2),
	deptno NUMBER(2)
	);

DESC emp_hw;

SELECT * FROM DICT;

SELECT owner, table_name
FROM all_tables;

SELECT * FROM dba_tables;

SELECT * FROM user_indexes;

GRANT CREATE VIEW TO scott;

CREATE VIEW vw_emp30all
	AS(SELECT *
		FROM emp
		WHERE deptno = 30);
		
SELECT rownum, e.*
FROM vw_emp30all e
WHERE rownum < 3;

SELECT 
	ROWNUM,
	ename,
	sal
FROM emp
ORDER BY sal desc;

SELECT
	ROWNUM, 
	e.*
FROM (SELECT *
			FROM emp
			ORDER BY sal DESC) e
WHERE ROWNUM < 2;

--½ÃÄö½º
CREATE TABLE dept_sequence
AS SELECT *
	FROM dept
	WHERE 1<>1;
	
SELECT * FROM dept_sequence;

CREATE SEQUENCE seq_dept_sequence2
INCREMENT BY 10
START WITH 10
MAXVALUE 90
MINVALUE 0
CYCLE;

INSERT INTO dept_sequence (deptno, dname, loc)
VALUES (seq_dept_sequence.NEXTVAL,  'DATABASE', 'SEOUL');

SELECT * FROM dept_sequence;

INSERT INTO dept_temp2
VALUES (seq_dept_sequence.NEXTVAL,  'DATABASE', 'SEOUL');

SELECT * FROM dept_temp2;


GRANT CREATE SYNONYM TO scott;

CREATE SYNONYM e
FOR scott.emp;

DROP SYNONYM e;

CREATE TABLE table_notnull(
	login_id  VARCHAR(20) NOT NULL,
	login_pwd VARCHAR(20) NOT NULL,
	tel       VARCHAR(20)
	);
	
DESC table_notnull;

INSERT INTO table_notnull (login_id, login_pwd, tel)
VALUES ('TESET_ID_1', NULL, '010-1234-5678');

SELECT *
FROM user_constraints;

