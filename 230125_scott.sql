SELECT sysdate
FROM dual;

SELECT COUNT(*)
FROM emp;

SELECT 13 * 113
FROM dual;

SELECT TO_CHAR(SYSDATE ,'YYYY-MM-DD(DY), HH24:MI:SS')
FROM dual;

SELECT TO_DATE('2023-01-19', 'YYYY-MM-DD')
FROM dual;

SELECT *
FROM emp
WHERE hiredate > TO_DATE('1985-01-01', 'YYYY-MM-DD');

SELECT 
	e.ename,
	e.sal * 12 + NVL(e.comm, 0) AS Year_sal
FROM emp e;

SELECT
	e.deptno,
	ROUND(AVG(e.sal), 2)
FROM emp e
GROUP BY e.deptno;

SELECT
	e.deptno,
	ROUND(AVG(e.sal), 2)
FROM emp e
WHERE e.sal >= 2000
GROUP BY e.deptno
	HAVING ROUND(AVG(e.sal), 2) >= 3000;
	
SELECT
	e.deptno,
	TO_CHAR(e.hiredate, 'YYYY'),
	MAX(e.sal),
	ROUND(AVG(e.sal), 2)
FROM emp e
GROUP BY ROLLUP(e.deptno, TO_CHAR(e.hiredate, 'YYYY')); 

SELECT
	e.empno,
	e.ename,
	d.loc
FROM emp e, dept d
WHERE e.deptno = d.deptno;

SELECT
	e.ename,
	e.sal,
	s.grade
FROM emp e, salgrade s
WHERE e.sal BETWEEN s.losal AND s.hisal;

SELECT
	e1.empno,
	e1.ename,
	e2.ename AS MGR_NAME
FROM emp e1, emp e2
WHERE e1.mgr = e2.empno;

CREATE USER ORCLSTUDY
IDENTIFIED BY ORACLE;


CREATE ROLE ROLESTUDY;

GRANT CONNECT, RESOURCE, CREATE VIEW , CREATE SYNONYM TO ROLESTUDY;

DROP ROLE rolestudy;

CREATE USER madang
IDENTIFIED BY  madang;

GRANT CONNECT, RESOURCE, CREATE VIEW , CREATE SYNONYM TO madang;