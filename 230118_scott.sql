SELECT *
FROM emp;

DESC emp;

SELECT
	1234*1234 AS result
FROM dual;

SELECT
	empno,
	ename
FROM emp
ORDER BY ename DESC;

SELECT *
FROM emp
WHERE deptno <> 30;

SELECT *
FROM emp
WHERE deptno IN (
                 10,
								 20,
								 30
								 );

SELECT *
FROM emp
WHERE sal BETWEEN 2000 AND 3000;

SELECT *
FROM emp
WHERE sal < 2000 OR sal > 3000;

SELECT *
FROM emp
WHERE sal NOT BETWEEN 2000 AND 3000;

SELECT *
FROM emp
WHERE ename > 'D';

SELECT *
FROM emp
WHERE ename LIKE 'D%';

SELECT *
FROM emp
WHERE ename LIKE '_D%';

SELECT *
FROM emp
WHERE ename LIKE '%D%';

SELECT *
FROM emp
WHERE ename NOT LIKE '%D%';

SELECT *
FROM emp
WHERE comm IS NULL;

SELECT *
FROM emp
WHERE comm IS NOT NULL;

SELECT
	empno,
	ename,
	deptno
FROM emp
WHERE deptno = 10
UNION
SELECT
	empno,
	ename,
	deptno
FROM emp
WHERE deptno = 20;

SELECT *
FROM emp
WHERE LENGTH(emp.ename) = 5;

SELECT 
	SUBSTR('HELLO', 3, 2)
FROM dual;

SELECT
	REPLACE('HELLO', 'LL', 'KK')
FROM dual;

SELECT
	TRIM('    HELLO    ')
FROM dual;

SELECT
	RPAD('HELLO', 10, '*')
FROM dual;

SELECT
	TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS') AS ���糯¥�ð�
FROM dual;

SELECT
	sysdate,
	TO_CHAR(sysdate, 'MM') AS mm,
	TO_CHAR(sysdate, 'MON') AS mon,
	TO_CHAR(sysdate, 'MONTH') AS month,
	TO_CHAR(sysdate, 'DD') AS dd,
	TO_CHAR(sysdate, 'DY') AS dy,
	TO_CHAR(sysdate, 'DAY') AS day
FROM dual;

SELECT
	TO_NUMBER('1,300', '999,999') 
	- TO_NUMBER('1,500', '999,999')
FROM dual;

SELECT
	TO_DATE('2018-07-14', 'YYYY-MM-DD') AS todate1,
	TO_DATE('20180714', 'YYYY-MM-DD') AS todate2
FROM dual;

SELECT *
FROM emp
WHERE hiredate > TO_DATE('1981/06/01','YYYY/MM/DD');

--NVL(NULL���� �˻��� ������ Ȥ�� ��, NULL�ϰ�� ��ȯ�� ������)
SELECT
	empno,
	ename,
	sal,
	comm,
	sal + comm,
	NVL(comm, 0),
	sal + NVL(comm, 0)
FROM emp;

SELECT
	ename,
	sal * 12 + NVL(comm, 0)
FROM emp;

--NVL2(NULL���� �˻��� ������ Ȥ�� ��, NULL�� �ƴҰ�� ��ȯ�� ������, NULL�ϰ�� ��ȯ�� ������)
SELECT
	empno,
	ename,
	comm,
	NVL2(comm, 'O', 'X') AS has_comm,
	NVL2(comm, SAL * 12 + comm , SAL * 12) AS year_sal
FROM emp;

--CASE ��(�� ���� ���� ��°��� �޶����� ����� ����)
SELECT
	empno,
	ename,
	job,
	sal,
	CASE job
		WHEN 'MANAHER' THEN sal * 1.1
		WHEN 'SALESMAN' THEN sal * 1.05
		WHEN 'ANALYST' THEN sal
		ELSE SAL * 1.03
		END AS upsal
FROM emp;

SELECT
	empno,
	RPAD(SUBSTR(empno, 1, 2), 4, '*'),
	ename,
	RPAD(SUBSTR(ename, 1, 2), LENGTH(ename), '*')
FROM emp;

SELECT
	empno,
	ename,
	sal,
	TRUNC(sal / 21.5, 3) AS DAY_PAY,
	ROUND(sal / 21.5 / 8, 2) AS TIME_PAY
FROM emp;

--������ �Լ� SUM, COUNT, MAX, MIN, AVG
SELECT SUM(sal) 
FROM emp;
SELECT COUNT(sal)
FROM emp;
SELECT MAX(sal)
FROM emp;
SELECT MIN(sal)
FROM emp;
SELECT AVG(sal)
FROM emp;

SELECT
	SUM(DISTINCT sal),
	SUM(ALL sal),
	SUM(sal)
FROM emp;

-- ��ȿ ������ ����
SELECT COUNT(*)
FROM emp;

--NULL ���� ����
SELECT COUNT(comm)
FROM emp;

--NULL ���� ����
SELECT COUNT(comm)
FROM emp;

--�μ� ��ȣ�� 30���� ���� ��
SELECT COUNT(*)
FROM emp
WHERE deptno = 30;

SELECT MAX(sal)
FROM emp
WHERE deptno = 10;

--�μ� ��ȣ�� 20�� ����� �Ի��� �� ���� �ֱ� �Ի���
SELECT MAX(hiredate)
FROM emp
WHERE deptno = 20;

--�μ� ��ȣ�� 20�� ����� �Ի��� �� ���� ������ �Ի���
SELECT MIN(hiredate)
FROM emp
WHERE deptno = 20;

--�μ� ��ȣ 30�� ������� ��� �޿�
SELECT ROUND(AVG(sal), 1)
FROM emp
WHERE deptno = 30;

--�μ� ��ȣ 30�� ������� ��� �߰� ����
SELECT AVG(comm)
FROM emp
WHERE deptno = 30;

--GROUP BY (GROUP BY�� ���� ���� SELECT�� ����� �� ����)
SELECT
	ROUND(AVG(sal), 1),
	deptno
FROM emp
GROUP BY deptno;

SELECT
	MAX(sal),
	deptno
FROM emp
GROUP BY deptno
ORDER BY deptno;

--�μ���, ��å���� ��� �޿�
SELECT
	deptno,
	job,
	AVG(sal)
FROM emp
GROUP BY deptno, job
ORDER BY deptno;

--�μ��� ��� �߰�����
SELECT
	deptno,
	NVL(AVG(comm), '0')
FROM emp
GROUP BY deptno
ORDER BY deptno;

SELECT
	ename,
	deptno,
	AVG(sal)
FROM emp
GROUP BY deptno, ename;

SELECT
	deptno,
	job,
	AVG(sal)
FROM emp
GROUP BY deptno, job
	HAVING AVG(sal) >= 2000
ORDER BY deptno, job;

--������ �Լ��� WHERE���� ��� �Ұ���
SELECT
	deptno,
	job,
	AVG(sal)
FROM emp
WHERE AVG(sal) >= 2000
GROUP BY deptno, job
ORDER BY deptno, job;

SELECT
	deptno,
	job,
	AVG(sal)
FROM emp
WHERE sal <= 3000
GROUP BY deptno, job
	HAVING AVG(sal) >= 2000
ORDER BY deptno, job;

/*
���� ���� 2 3 4 5 1 6
1. SELECT
2. FROM
3. WHERE
4. GROUP BY
5. HAVING
6. ORDER BY
*/

--ROLLUP GROUP BY �����ʺ��� �������� �߰� �հ�, �����հ�
	SELECT
	deptno,
	job,
	count(*),
	MAX(sal),
	SUM(sal),
	ROUND(AVG(sal), 1)
FROM emp
GROUP BY
	ROLLUP(
		deptno,
		job
		)
ORDER BY
	deptno,
	job;
	
--CUBE �߰��հ� �����հ� ��� �׷캰
SELECT
	deptno,
	job,
	count(*),
	MAX(sal),
	SUM(sal),
	ROUND(AVG(sal), 1)
FROM emp
GROUP BY
	CUBE(
		deptno,
		job
		)
ORDER BY
	deptno,
	job;
	
SELECT
	deptno,
	job,
	COUNT(*)
FROM emp
GROUP BY
	deptno,
	ROLLUP(job);	
	
SELECT
	deptno,
	job,
	COUNT(*)
FROM emp
GROUP BY
	job,
	ROLLUP(deptno);
	
SELECT
	deptno,
	TRUNC(AVG(sal)) AS avg_sal,
	MAX(sal) AS max_sal,
	MIN(sal) AS min_sal,
	COUNT(*) AS cnt
FROM emp
GROUP BY deptno;

SELECT
	job,
	COUNT(*)
FROM emp
GROUP BY job
 HAVING COUNT(job) >=3;
 
--JOIN ���� ���̺��� �ϳ�ó�� �����ִ°�

SELECT *
FROM
	emp,
	dept
WHERE emp.deptno = dept.deptno
ORDER BY empno;

SELECT
	e.ename,
	e.job,
	e.sal,
	d.dname,
	d.loc
FROM
	emp e,
	dept d
WHERE e.deptno = d.deptno;

SELECT
	e.ename,
	d.dname
FROM 
	emp e,
	dept d
WHERE e.deptno = d.deptno;

/*
	���� ����
		� ����
			� ����(equi join)
			���� ����(inner join)
			�ܼ� ����(simple join)
		
		�� ����
			�� ����(non-equi join)
*/

SELECT
	e.ename,
	d.dname
FROM 
	emp e,
	dept d
WHERE e.deptno = d.deptno
	AND e.sal >= 3000;

SELECT
	e.empno,
	e.ename,
	e.job,
	e.mgr,
	e.hiredate,
	e.sal,
	e.comm,
	e.deptno,
	d.dname,
	d.loc
FROM
	emp e,
	dept d
WHERE
	e.deptno = d.deptno
	AND e.sal <= 2500
	AND e.empno <=9999;

-- �� ����
SELECT
	e.*,
	s.grade
FROM
	emp e,
	salgrade s
WHERE e.sal BETWEEN s.losal AND s.hisal;

-- ��ü ����
SELECT
	e1.empno,
	e1.ename,
	e2.ename AS mgr_name
FROM
	emp e1,
	emp e2
WHERE e1.mgr = e2.empno(+); --empno�� ���� ���(�ٸ����� null�̾)

--������ �ܺ� ����
SELECT
	e1.empno,
	e1.ename,
	e1.mgr,
	e2.empno AS mgr_empno,
	e2.ename AS mgr_ename
FROM
	emp e1,
	emp e2
WHERE e1.mgr = e2.empno(+) --empno�� ���� ���(�ٸ����� null�̾)
ORDER BY e1.empno;

--���� �ܺ� ����
SELECT
	e1.empno,
	e1.ename,
	e1.mgr,
	e2.empno AS mgr_empno,
	e2.ename AS mgr_ename
FROM
	emp e1,
	emp e2
WHERE e1.mgr(+) = e2.empno --empno�� ���� ���(�ٸ����� null�̾)
ORDER BY e1.empno;
