--gitlab handbook ��Ÿ�� ���̵忡 ���� �ۼ��Ͽ����ϴ�.

-- SELECT�� ����
SELECT 
  empno,
  ename, 
  deptno 
FROM emp;

 -- �ߺ� ����    
SELECT DISTINCT deptno 
FROM emp;

--AS �÷� �� ����    
SELECT 
	ename,
	sal AS year_sal 
FROM emp 
ORDER BY year_sal; 
 
SELECT 
	deptno,
	ename 
FROM emp 
ORDER BY 
	deptno DESC,
	ename;
    
SELECT ename 
FROM emp
WHERE deptno = '30'; 
    
SELECT * 
FROM emp 
WHERE JOB = 'salesman' 
	AND deptno = '30';

 -- ��� ���� ����    
SELECT 
	ename,
	sal 
FROM emp 
WHERE sal * 12 >= 30000;
    
SELECT * 
FROM emp 
WHERE deptno = '20' 
	OR JOB = 'SALESMAN';
    
SELECT *
FROM emp 
WHERE sal >= 2500
	AND job = 'ANALYST';

--ENAME ù ���ڰ� F �̻�    
SELECT ename 
FROM emp
WHERE ename >= 'F' 
ORDER BY ename; 
    
SELECT * 
FROM emp 
WHERE ename <= 'FORZ' 
ORDER BY ename; --ù���� ���Ͻ� �� ���� �� 

-- �Ʒ� 3���� ��� Not Equal ������ <>�� ���� �ַ� ����
SELECT * 
FROM emp 
WHERE job <> 'SALESMAN';

SELECT * 
FROM emp 
WHERE job != 'SALESMAN';

SELECT * 
FROM emp 
WHERE job ^= 'SALESMAN';
    
SELECT * 
FROM emp 
WHERE NOT job = 'SALESMAN'; --IN, BETWEEEN, IS NULL�� ���� ����

--��å�� MANAGER �̰ų� SALESMAN�̰ų� CLERK �� ���
SELECT * 
FROM emp 
WHERE job = 'MANAGER'
	OR job = 'SALESMAN' 
	OR job = 'CLERK';
	
--IN ������ ���
SELECT * 
FROM emp 
WHERE job IN (
							'MANAGER',
							'SALESMAN',
							'CLERK'
							);

--NOT IN
SELECT * 
FROM emp 
WHERE job NOT IN (
									'MANAGER',
									'SALESMAN',
									'CLERK'
									);

--�μ� ��ȣ�� 10, 20���� ��� ����
SELECT *
FROM emp
WHERE deptno IN (10, 20);

--SAL 2000 �̻� 3000 ������ ��� �̸�, ����
SELECT 
	ename,
	sal
FROM emp
WHERE sal >= 2000
	AND sal <= 3000;
    
--BETWEEN A AND B
SELECT 
	ename,
	sal
FROM emp
WHERE sal BETWEEN 2000 AND 3000;
    
--LIKE�� ���ϵ� ī�� (�Ϻ� ���ڿ��� �����ϴ� ���ڿ��� �˻��� ��)
SELECT *
FROM emp
WHERE ename LIKE 'S%'; --S�� �����ϴ� ���ڿ�

SELECT *
FROM emp
WHERE ename LIKE '%S%';--S�� ���ִ� ��� ���ڿ�

SELECT *
FROM emp
WHERE ename LIKE '%S'; --S�� ������ ���ڿ�

SELECT *
FROM emp
WHERE ename LIKE '_L%'; --�Ǿ��ڸ� ���� ��°�ڸ� L�� �����ϴ� ���ڿ�
    
--��� �̸��� L�� ������ ���� ���
SELECT *
FROM emp
WHERE ename NOT LIKE '%L%';

--NULL
SELECT *
FROM emp
WHERE comm IS NULL;
    
--MGR �� NULL�� �����
SELECT ename
FROM emp
WHERE mgr IS NULL;
--NULL�� �ƴ� �����
SELECT ename
FROM emp
WHERE mgr IS NOT NULL;
    
SELECT 
	empno, 
	ename, 
	sal, 
	deptno
FROM emp
WHERE deptno = 10
UNION --�ΰ��� ǥ �����Ͽ� ǥ���� ��(�÷� ���İ� ���� ���ƾ���) �ߺ��� ���ŵ�
SELECT 
	empno, 
	ename, 
	sal, 
	deptno
FROM emp
WHERE deptno = 20;
    
SELECT 
	empno, 
	ename,
	sal, 
	deptno
FROM emp
WHERE deptno = 10
UNION ALL --�ΰ��� ǥ �����Ͽ� ǥ���� ��(�÷� ���İ� ���� ���ƾ���) �ߺ��� ��� ��
SELECT 
	empno, 
	ename,
	sal, 
	deptno
FROM emp
WHERE deptno = 10;
    
SELECT 
	empno, 
	ename,
	sal,
	deptno
FROM emp
MINUS --�Ʒ� ǥ�� �����ϰ� ǥ���� ��(�÷� ���İ� ���� ���ƾ���)
SELECT 
	empno, 
	ename,
	sal,
	deptno
FROM emp
WHERE deptno = 10;
    
SELECT 
	empno,
	ename,
	sal,
	deptno
FROM emp
INTERSECT --�Ʒ� ǥ�� ��ġ�� �κи� ǥ���� ��(�÷� ���İ� ���� ���ƾ���)
SELECT 
	empno, 
	ename,
	sal, 
	deptno
FROM emp
WHERE deptno = 10;
    
--SAL 2000 �̻� 3000 ���� INTERSECT Ȱ��
SELECT *
FROM emp
WHERE sal >= 2000
INTERSECT
SELECT *
FROM emp
WHERE sal <= 3000;
        
--ENAME�� S�� ������ ��� ������ ��� ���
SELECT*
FROM emp
WHERE ename LIKE '%S';
    
--30�� �μ�(DEPTNO)�� �ٹ��ϰ� �ִ� ��� �� ��å(job)�� SALESMAN�� ����� �����ȣ, �̸�, ��å, �޿�, �μ���ȣ ���
SELECT 
    empno,
    ename,
    job,
    sal,
    deptno
FROM emp
WHERE deptno = 30;

--20, 30�� �μ��� �ٹ��ϰ� �ִ� ��� �� �޿��� 2000 �ʰ��� ���
SELECT *
FROM emp
WHERE deptno IN (20, 30);

--���� �����ϴ� �Լ� UPPER, LOWER, INITCAP 
SELECT
	ename,
	UPPER(ename), -- �빮��
	LOWER(ename), -- �ҹ���
	INITCAP(ename) -- ù���� �빮��
FROM emp;

-- SMITH�� JOB
SELECT job
FROM emp
WHERE LOWER(ename) = 'smith';

--LENGTH �Լ�
SELECT
	ename AS employee_name,
	LENGTH(ename) AS name_length
FROM emp;

--�̸��� 5���� �̻��� �����
SELECT ename AS employee_name
FROM emp
WHERE LENGTH(ename) >= 5;

--��å�� 6���� �̻��� �����
SELECT ename AS employee_name
FROM emp
WHERE LENGTH(job) >= 6;

--LENGTHB() ����Ʈ �� ��ȯ �ѱ��� ���ڴ� 2����Ʈ ����� 1����Ʈ
SELECT
	LENGTH('�ѱ�'),
	LENGTHB('�ѱ�')
FROM dual; --���� ���̺� �ӽ� �����̳� �Լ��� ��� �� Ȯ�� �뵵

--SUBSTR(���ڿ�, ����, ����)  ���̴� �����ϸ� ���ۺ��� ���� �����
SELECT
	job,
	SUBSTR(job, 1, 2),
	SUBSTR(job, 3, 2),
	SUBSTR(job, 5)
FROM emp;

--������� �̸��� 3��° ���ں��� ������ ���
SELECT SUBSTR(ename, 3)
FROM emp;

SELECT
	job,
	SUBSTR(job, -LENGTH(job)), --  -��ȣ�� �����ϸ� �ڿ��� ī��Ʈ
	SUBSTR(job, -LENGTH(job), 2),
	SUBSTR(job, -3)
FROM emp;

--INSTR �Լ��� Ư�� ���� ��ġ ã��
SELECT
	INSTR('HELLO, ORACLE!', 'L') AS instr_1,
	INSTR('HELLO, ORACLE!', 'L', 5) AS instr_2,
	INSTR('HELLO, ORACLE!', 'L', 2, 2) AS instr_3
FROM dual;

--�̸��� S�� �ִ� ���
SELECT *
FROM emp
WHERE ename LIKE '%S%';

--REPLACE([���ڿ� ������ Ȥ�� �� �̸�], [ã�� ����], [��ü�� ����])
SELECT REPLACE(job, 'CLERK', 'SPIKE')
FROM emp;

--LPAD([���ڿ�], [������ �ѱ���], [ä�� ���ڿ�]) RPAD ���� ������ ����
SELECT LPAD('Oracle', 10, 'L')
FROM dual;

SELECT RPAD('Oracle', 10, 'R')
FROM dual;

SELECT
	RPAD('920119-', 14, '*') AS rpad_1,
	RPAD('010-8021-', 13, '*') AS rpad_2
FROM dual;

--CONCAT �� ���ڿ� �̾� ���̱� (�ΰ��� �ۿ� �ȵ�)
SELECT  
	ename,
	CONCAT(
				CONCAT(
							 SUBSTR(ename, -1, 1),
				       SUBSTR(ename, -2, 1)
							 ),
				SUBSTR(ename, -3, 1)
				 )
FROM emp;

-- ||�� ���ڿ� �̾� ���̱�(�� ���� ����)
SELECT  
	ename,
  SUBSTR(ename, -1, 1) 
		|| SUBSTR(ename, -2, 1) 
		|| SUBSTR(ename, -3, 1)
FROM emp;

--TRIM ��� ���� �ڸ���
SELECT TRIM('    HELLO     ')
FROM dual;
--RTRIM ������ ���� �ڸ���
SELECT RTRIM('    HELLO     ')
FROM dual;
--LTRIM ���� ���� �ڸ���
SELECT LTRIM('    HELLO     ')
FROM dual;

--�ݿø� ROUND([����], [���� �� �Ҽ��� �ڸ�]) 
SELECT 
	ROUND(1234.5678) AS ROUND,
	ROUND(1234.5678, 0) AS ROUND_0,
	ROUND(1234.5678, 1) AS ROUND_1,
	ROUND(1234.5678, 2) AS ROUND_2,
	ROUND(1234.5678, -1) AS ROUND_MINUS1,
	ROUND(1234.5678, -2) AS ROUND_MINUS2
FROM dual;

--123456�� 1234�� ���� ���� �Ҽ��� ���� 2�ڸ����� �ݿø� �Ͽ� ��Ÿ����?
SELECT
	ROUND(123456 / 1234, 2)
FROM dual;

--���� TRUNC([����], [���� �� �Ҽ��� �ڸ�]) 
SELECT 
	TRUNC(1234.5678) AS TRUNC,
	TRUNC(1234.5678, 0) AS TRUNC_0,
	TRUNC(1234.5678, 1) AS TRUNC_1,
	TRUNC(1234.5678, 2) AS TRUNC_2,
	TRUNC(1234.5678, -1) AS TRUNC_MINUS1,
	TRUNC(1234.5678, -2) AS TRUNC_MINUS2
FROM dual;

--�ø� CEIL(+��ȣ ����), FLOOR(-��ȣ ����)
SELECT 
	CEIL(3.14),
	FLOOR(3.14),
	CEIL(-3.14),
	FLOOR(-3.14)
FROM dual;

--MOD ������
SELECT 
	MOD(15, 6),
	MOD(10, 2),
	MOD(11, 2)
FROM dual;

--��¥������ �Լ�
SELECT
	sysdate AS today,
	sysdate-1 AS yesterday,
	sysdate+1 AS tomorrow
FROM dual;

SELECT
	sysdate,
	ADD_MONTHS(sysdate, 3)
FROM dual;

SELECT
	empno,
	ename,
	hiredate,
	ADD_MONTHS(hiredate, 120) AS work10year
FROM emp;

SELECT
	empno,
	ename,
	hiredate,
	sysdate,
	ROUND(MONTHS_BETWEEN(hiredate, sysdate)) AS months1,
	CEIL(MONTHS_BETWEEN(sysdate, hiredate)) AS months2,
	TRUNC(MONTHS_BETWEEN(sysdate, hiredate)) AS months3
FROM emp;

SELECT
	sysdate,
	TO_CHAR(sysdate, 'CC') AS FORMAT_CC, --����
	TO_CHAR(sysdate, 'AD') AS FORMAT_AD, --AD
	TO_CHAR(sysdate, 'Q') AS FORMAT_Q, --�б�
	TO_CHAR(sysdate, 'MI') AS FORMAT_MI, --��
	TO_CHAR(sysdate, 'MM') AS FORMAT_MM --��
FROM dual;
