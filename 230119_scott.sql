SHOW user;

SELECT
	deptno
FROM emp;

SELECT
	empno,
	ename,
	mgr
FROM emp
WHERE sal >= 3000;

SELECT *
FROM emp e
WHERE e.ename LIKE '_D%';

SELECT
	e.empno,
	e.ename,
	e.deptno
FROM emp e
MINUS
SELECT
	e.empno,
	e.ename,
	e.deptno
FROM emp e
WHERE deptno = 10;

SELECT SUBSTR('HELLO', 3, 2)
FROM dual;

SELECT COUNT(*)
FROM emp;

SELECT
	SUM(e.sal),
	ROUND(AVG(e.sal), 2)
FROM emp e;

SELECT
	e.ename,
	LENGTH(e.ename)
FROM emp e;

SELECT
	e.ename,
	LENGTH(e.ename)
FROM emp e
WHERE LENGTH(e.ename) > 5;

SELECT REPLACE('HELLO', 'LL', 'KK')
FROM dual;

SELECT TRIM('   HELLO')
FROM dual;

SELECT RPAD('HELLO', 10, '*')
FROM dual;

SELECT
	TO_CHAR(sysdate, 'YY/MM/DD, HH24:MI:SS')
FROM dual;

SELECT
	TO_DATE('2023-01-19', 'YY/MM/DD')
FROM dual;

SELECT e.*
FROM emp e
WHERE TO_DATE(e.hiredate) > TO_DATE('1985-01-01', 'YY/MM/DD');

SELECT
	e.ename,
	NVL(e.comm, 0)
FROM emp e;

SELECT
	e.ename,
	NVL2(e.comm, '있음', '없음')
FROM emp e;

SELECT
	e.empno,
	e.ename,
	e.comm,
	CASE
		WHEN e.comm IS NULL THEN '해당사항 없음'
		WHEN e.comm =0 THEN '수당 없음'
		WHEN e.comm >0 THEN '수당 : ' || e.comm
	END AS comm_text
FROM emp e;

SELECT
	e.sal AS 월급,
	TRUNC(e.sal / 22, 2) AS 일당,
	TRUNC(e.sal / 22 / 8, 2) AS 시급
FROM emp e;

--서브쿼리
SELECT
	e.ename,
	e.sal
FROM emp e
WHERE e.sal > (SELECT e.sal
								FROM emp e
								WHERE e.ename = 'JONES'
								) --서브쿼리엔 orderby를 사용할 수 없음
ORDER BY e.ename;								

--ALLEN보다 많은 추가수당을 받는 사원정보
SELECT e.*
FROM emp e
WHERE e.sal > (
							 SELECT e.sal
							 FROM emp e
							 WHERE e.ename = 'ALLEN'
							 );

--SCOTT 보다 늦게 입사한 사원 이름 입사일
SELECT
	e.ename,
	e.hiredate
FROM emp e
WHERE hiredate > (
								  SELECT e.hiredate
									FROM emp e
									WHERE e.ename = 'SCOTT'
									);
									
SELECT
	e.empno,
	e.ename,
	e.job,
	e.sal,
	d.deptno,
	d.dname,
	d.loc
FROM
	emp e,
	dept d
WHERE e.deptno = d.deptno
	AND d.loc = 'DALLAS'
	AND e.sal > (
							 SELECT AVG(e.sal)
						   FROM emp e
			         );
				
SELECT
	e.deptno,
	e.ename,
	e.sal
FROM emp e
WHERE e.sal IN (
							  SELECT MAX(e.sal)
								FROM emp e
								GROUP BY e.deptno
								)
ORDER BY e.deptno;			

--ANY, SOME 하나라도 만족하면 출력
SELECT e.*
FROM emp e
WHERE e.sal < ANY (
									 SELECT e.sal
									 FROM emp e
									 WHERE deptno = 30
									 )
ORDER BY e.sal, e.empno;		
SELECT e.*
FROM emp e
WHERE e.sal < SOME (
									 SELECT e.sal
									 FROM emp e
									 WHERE deptno = 30
									 )
ORDER BY e.sal, e.empno;				

--ALL 전부 만족하면 출력
SELECT e.*
FROM emp e
WHERE e.sal < ALL (
									 SELECT e.sal
									 FROM emp e
									 WHERE deptno = 30
									 )
ORDER BY e.sal, e.empno;					

--30번 부서 사원들의 최소 급여보다 많은 급여를 받는 사원 정보
SELECT e.*
FROM emp e
WHERE e.sal > ANY (
									 SELECT e.sal
									 FROM emp e
									 WHERE e.deptno =30
									 )
ORDER BY e.deptno;					

--EXISTS 서브쿼리 내 데이터가 하나라도 있으면 출력
SELECT e.*
FROM emp e
WHERE EXISTS (
							SELECT d.dname
							FROM dept d
							WHERE deptno = 30
							);
					
							
--10번 부서에 속한 모든사원들보다 일찍 입사한 사원정보
SELECT e.*
FROM emp e
WHERE hiredate < ALL (
											SELECT e.hiredate
											FROM emp e
											WHERE deptno = 10
											);
					
--FROM 절 서브쿼리_ 인라인 뷰
SELECT
	e10.empno,
	e10.ename,
	e10.deptno,
	d.dname,
	d.loc
FROM
	(SELECT * FROM emp WHERE deptno = 10) e10,
	dept d
WHERE e10.deptno = d.deptno;

--WITH
WITH
e10 AS (SELECT * FROM emp WHERE deptno = 10),
d AS (SELECT * FROM dept)
SELECT
	e10.empno,
	e10.ename,
	e10.deptno,
	d.dname,
	d.loc
FROM
	e10,
	d
WHERE e10.deptno = d.deptno;

--SELECT 절 서브쿼리 (스칼라 서브쿼리 scalar subquery)
SELECT
	e.empno,
	e.ename,
	e.job,
	e.sal,
	(SELECT s.grade FROM salgrade s WHERE e.sal BETWEEN s.losal AND s.hisal) AS salgrade,
	e.deptno,
	(SELECT d.dname FROM dept d WHERE e.deptno = d.deptno) AS dname
FROM emp e;

/*
Data Manipilation Language 데이터 조작어 (DML)  INSERT, UPDATE, DELETE  _테이블 내 데이터 조작
Data Definition Language 데이터 정의어 (DDL)  CREATE, RENAME, TRUNCATE, ALTER, DROP _ 테이블 자체 조작
Data Control Language 데이터 (DCL) GRANT, REVOKE
Transaction Control Language 트랜잭션 제어 (TCL) COMMIT, ROLLBACK
*/

CREATE TABLE dept_temp
	AS SELECT * FROM dept;
	
DESC dept_temp;

SELECT *
FROM dept_temp;

CREATE TABLE emp_temp
	AS SELECT *
		FROM emp
		WHERE 1 <> 1;
	
DESC emp_temp;

SELECT *
FROM emp_temp;

INSERT INTO dept_temp (deptno, dname, loc)
	VALUES(50, 'DATABASE', 'SEOUL');
	
SELECT *
FROM dept_temp;

INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
	VALUES (9999, '홍길동', 'PRESIDENT', NULL, TO_DATE('2001/01/01', 'YYYY/MM/DD'), 5000, 1000, 10);
	

INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
	VALUES (9999, '홍길동', 'PRESIDENT', NULL, '2001/01/01', 5000, 1000, 10);

INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
	VALUES (9999, '홍길동', 'PRESIDENT', NULL, sysdate, 5000, 1000, 10);
	
SELECT *
FROM emp_temp;

--서브쿼리로 여러 데이터 추가하기(VALUES 없음 주의)
INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
	SELECT e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, e.deptno
	FROM emp e, salgrade s
	WHERE e.sal BETWEEN s.losal AND s.hisal
		AND s.grade = 1;
		
SELECT *
FROM emp_temp;

CREATE TABLE dept_temp2
	AS SELECT *
	FROM dept;

--UPDATE
UPDATE dept_temp2
	SET dname = 'DATABASE',
			loc = 'SEOUL'
	WHERE deptno = 40;
	
SELECT *
FROM dept_temp2;

UPDATE dept_temp2
	SET loc = 'SEOUL';

ROLLBACK;
SELECT *
FROM dept_temp2;

DROP TABLE emp_temp;

CREATE TABLE emp_temp
	AS SELECT *
			FROM emp;
			
UPDATE dept_temp2
	SET (dname, loc)
	=(
		SELECT
		dname,
		loc
		FROM
		dept
		WHERE deptno = 40
		)
WHERE deptno = 40;

SELECT *
FROM dept_temp2;

UPDATE dept_temp2
	SET loc = 'SEOUL'
WHERE deptno = (
								SELECT deptno
								FROM dept_temp2
								WHERE dname = 'OPERATIONS');

SELECT *
FROM dept_temp2;

CREATE TABLE emp_temp2
	AS SELECT *
			FROM emp;
			
DELETE FROM emp_temp2
WHERE job = 'MANAGER';

SELECT *
FROM emp_temp2;

DELETE FROM emp_temp2
WHERE empno IN (
								SELECT e.empno
								FROM emp_temp2 e, salgrade s
								WHERE e.sal BETWEEN s.losal AND s.hisal
								AND s.grade = 3
								AND deptno = 30
								);

SELECT *
FROM emp_temp2;

DELETE
FROM emp_temp
WHERE sal >= 3000;

SELECT *
FROM emp_temp;

DELETE
FROM emp_temp;

SELECT *
FROM emp_temp;

CREATE TABLE dept_tcl
	AS SELECT *
		FROM dept;

SELECT *
FROM dept_tcl;

DROP TABLE dept_tcl;

INSERT INTO dept_tcl(dname, deptno, loc)
	VALUES('RESOURCES', 50, 'SEOUL');
	
SELECT *
FROM dept_tcl;

	
