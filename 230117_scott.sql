-- SELECT�� ����
SELECT EMPNO, ENAME, DEPTNO 
    FROM EMP;

 -- �ߺ� ����    
SELECT DISTINCT DEPTNO 
    FROM EMP;

--AS �÷� �� ����    
SELECT ENAME, SAL AS YEAR_SAL 
    FROM EMP 
    ORDER BY YEAR_SAL; 
 
SELECT DEPTNO, ENAME 
    FROM EMP 
    ORDER BY DEPTNO DESC, ENAME;
    
SELECT ENAME 
    FROM EMP
    WHERE DEPTNO = '30'; 
    
SELECT * 
    FROM EMP 
    WHERE JOB = 'SALESMAN' AND DEPTNO = '30';

 -- ��� ���� ����    
SELECT ENAME, SAL 
    FROM EMP 
    WHERE SAL * 12 >= 30000;
    
SELECT * 
    FROM EMP 
    WHERE DEPTNO = '20' OR JOB = 'SALESMAN';
    
SELECT *
    FROM EMP 
    WHERE SAL >= 2500 AND JOB = 'ANALYST';

--ENAME ù ���ڰ� F �̻�    
SELECT ENAME 
    FROM EMP
    WHERE ENAME >= 'F' 
    ORDER BY ENAME; 
    
SELECT * FROM EMP WHERE ENAME <= 'FORZ' ORDER BY ENAME; --ù���� ���Ͻ� �� ���� �� 

-- �Ʒ� 3���� ��� Not Equal ������ <>�� ���� �ַ� ����
SELECT * 
    FROM EMP 
    WHERE JOB <> 'SALESMAN';
SELECT * 
    FROM EMP 
    WHERE JOB != 'SALESMAN';
SELECT * 
    FROM EMP 
    WHERE JOB ^= 'SALESMAN';
    
SELECT * 
    FROM EMP 
    WHERE NOT JOB = 'SALESMAN'; --IN, BETWEEEN, IS NULL�� ���� ����

--��å�� MANAGER �̰ų� SALESMAN�̰ų� CLERK �� ���
SELECT * 
    FROM EMP 
    WHERE JOB = 'MANAGER' OR JOB = 'SALESMAN' OR JOB = 'CLERK';
--IN ������ ���
SELECT * 
    FROM EMP 
    WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK');
--NOT IN
SELECT * 
    FROM EMP 
    WHERE JOB NOT IN ('MANAGER', 'SALESMAN', 'CLERK');

--�μ� ��ȣ�� 10, 20���� ��� ����
SELECT *
    FROM EMP
    WHERE DEPTNO IN (10, 20);

--SAL 2000 �̻� 3000 ������ ��� �̸�, ����
SELECT ENAME, SAL
    FROM EMP
    WHERE SAL >= 2000 AND SAL <= 3000;
    
--BETWEEN A AND B
SELECT ENAME, SAL
    FROM EMP
    WHERE SAL BETWEEN 2000 AND 3000;
    
--LIKE�� ���ϵ� ī�� (�Ϻ� ���ڿ��� �����ϴ� ���ڿ��� �˻��� ��)
SELECT *
    FROM EMP
    WHERE ENAME LIKE 'S%'; --S�� �����ϴ� ���ڿ�
SELECT *
    FROM EMP
    WHERE ENAME LIKE '%S%';--S�� ���ִ� ��� ���ڿ�
SELECT *
    FROM EMP
    WHERE ENAME LIKE '%S'; --S�� ������ ���ڿ�
SELECT *
    FROM EMP
    WHERE ENAME LIKE '_L%'; --�Ǿ��ڸ� ���� ��°�ڸ� L�� �����ϴ� ���ڿ�
    
--��� �̸��� L�� ������ ���� ���
SELECT *
    FROM EMP
    WHERE ENAME NOT LIKE '%L%';

--NULL
SELECT *
    FROM EMP
    WHERE COMM IS NULL;
    
--MGR �� NULL�� �����
SELECT ENAME
    FROM EMP
    WHERE MGR IS NULL;
--NULL�� �ƴ� �����
SELECT ENAME
    FROM EMP
    WHERE MGR IS NOT NULL;
    
SELECT *
    FROM EMP
    WHERE SAL > NULL AND COMM IS NULL;
