--gitlab handbook 스타일 가이드에 맞춰 작성하였습니다.

-- SELECT문 기초
SELECT 
  empno,
  ename, 
  deptno 
FROM emp;

 -- 중복 제거    
SELECT DISTINCT deptno 
FROM emp;

--AS 컬럼 명 변경    
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

 -- 산술 연산 가능    
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

--ENAME 첫 문자가 F 이상    
SELECT ename 
FROM emp
WHERE ename >= 'F' 
ORDER BY ename; 
    
SELECT * 
FROM emp 
WHERE ename <= 'FORZ' 
ORDER BY ename; --첫문자 동일시 그 이후 비교 

-- 아래 3가지 모두 Not Equal 연산자 <>가 가장 주로 쓰임
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
WHERE NOT job = 'SALESMAN'; --IN, BETWEEEN, IS NULL과 같이 쓸때

--직책이 MANAGER 이거나 SALESMAN이거나 CLERK 인 사원
SELECT * 
FROM emp 
WHERE job = 'MANAGER'
	OR job = 'SALESMAN' 
	OR job = 'CLERK';
	
--IN 연산자 사용
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

--부서 번호가 10, 20번인 사원 정보
SELECT *
FROM emp
WHERE deptno IN (10, 20);

--SAL 2000 이상 3000 이하인 사원 이름, 월급
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
    
--LIKE와 와일드 카드 (일부 문자열을 포함하는 문자열을 검색할 때)
SELECT *
FROM emp
WHERE ename LIKE 'S%'; --S로 시작하는 문자열

SELECT *
FROM emp
WHERE ename LIKE '%S%';--S가 들어가있는 모든 문자열

SELECT *
FROM emp
WHERE ename LIKE '%S'; --S로 끝나는 문자열

SELECT *
FROM emp
WHERE ename LIKE '_L%'; --맨앞자리 무관 둘째자리 L로 시작하는 문자열
    
--사원 이름에 L이 들어가있지 않은 사원
SELECT *
FROM emp
WHERE ename NOT LIKE '%L%';

--NULL
SELECT *
FROM emp
WHERE comm IS NULL;
    
--MGR 이 NULL인 사람들
SELECT ename
FROM emp
WHERE mgr IS NULL;
--NULL이 아닌 사람들
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
UNION --두개의 표 병합하여 표시할 때(컬럼 형식과 수가 같아야함) 중복은 제거됨
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
UNION ALL --두개의 표 병합하여 표시할 때(컬럼 형식과 수가 같아야함) 중복도 출력 됨
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
MINUS --아래 표를 제외하고 표시할 때(컬럼 형식과 수가 같아야함)
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
INTERSECT --아래 표와 겹치는 부분만 표시할 때(컬럼 형식과 수가 같아야함)
SELECT 
	empno, 
	ename,
	sal, 
	deptno
FROM emp
WHERE deptno = 10;
    
--SAL 2000 이상 3000 이하 INTERSECT 활용
SELECT *
FROM emp
WHERE sal >= 2000
INTERSECT
SELECT *
FROM emp
WHERE sal <= 3000;
        
--ENAME이 S로 끝나는 사원 데이터 모두 출력
SELECT*
FROM emp
WHERE ename LIKE '%S';
    
--30번 부서(DEPTNO)에 근무하고 있는 사원 중 직책(job)이 SALESMAN인 사원의 사원번호, 이름, 직책, 급여, 부서번호 출력
SELECT 
    empno,
    ename,
    job,
    sal,
    deptno
FROM emp
WHERE deptno = 30;

--20, 30번 부서에 근무하고 있는 사원 중 급여가 2000 초과인 사원
SELECT *
FROM emp
WHERE deptno IN (20, 30);

--문자 가공하는 함수 UPPER, LOWER, INITCAP 
SELECT
	ename,
	UPPER(ename), -- 대문자
	LOWER(ename), -- 소문자
	INITCAP(ename) -- 첫글자 대문자
FROM emp;

-- SMITH의 JOB
SELECT job
FROM emp
WHERE LOWER(ename) = 'smith';

--LENGTH 함수
SELECT
	ename AS employee_name,
	LENGTH(ename) AS name_length
FROM emp;

--이름이 5글자 이상인 사람들
SELECT ename AS employee_name
FROM emp
WHERE LENGTH(ename) >= 5;

--직책이 6글자 이상인 사람들
SELECT ename AS employee_name
FROM emp
WHERE LENGTH(job) >= 6;

--LENGTHB() 바이트 수 반환 한글은 글자당 2바이트 영어는 1바이트
SELECT
	LENGTH('한글'),
	LENGTHB('한글')
FROM dual; --더미 테이블 임시 연산이나 함수의 결과 값 확인 용도

--SUBSTR(문자열, 시작, 길이)  길이는 생략하면 시작부터 전부 출력함
SELECT
	job,
	SUBSTR(job, 1, 2),
	SUBSTR(job, 3, 2),
	SUBSTR(job, 5)
FROM emp;

--모든사원의 이름을 3번째 글자부터 끝까지 출력
SELECT SUBSTR(ename, 3)
FROM emp;

SELECT
	job,
	SUBSTR(job, -LENGTH(job)), --  -부호로 시작하면 뒤에서 카운트
	SUBSTR(job, -LENGTH(job), 2),
	SUBSTR(job, -3)
FROM emp;

--INSTR 함수로 특정 문자 위치 찾기
SELECT
	INSTR('HELLO, ORACLE!', 'L') AS instr_1,
	INSTR('HELLO, ORACLE!', 'L', 5) AS instr_2,
	INSTR('HELLO, ORACLE!', 'L', 2, 2) AS instr_3
FROM dual;

--이름에 S가 있는 사원
SELECT *
FROM emp
WHERE ename LIKE '%S%';

--REPLACE([문자열 데이터 혹은 열 이름], [찾는 문자], [대체할 문자])
SELECT REPLACE(job, 'CLERK', 'SPIKE')
FROM emp;

--LPAD([문자열], [데이터 총길이], [채울 문자열]) RPAD 왼쪽 오른쪽 차이
SELECT LPAD('Oracle', 10, 'L')
FROM dual;

SELECT RPAD('Oracle', 10, 'R')
FROM dual;

SELECT
	RPAD('920119-', 14, '*') AS rpad_1,
	RPAD('010-8021-', 13, '*') AS rpad_2
FROM dual;

--CONCAT 두 문자열 이어 붙이기 (두개씩 밖에 안됨)
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

-- ||로 문자열 이어 붙이기(더 많이 가능)
SELECT  
	ename,
  SUBSTR(ename, -1, 1) 
		|| SUBSTR(ename, -2, 1) 
		|| SUBSTR(ename, -3, 1)
FROM emp;

--TRIM 모든 공백 자르기
SELECT TRIM('    HELLO     ')
FROM dual;
--RTRIM 오른쪽 공백 자르기
SELECT RTRIM('    HELLO     ')
FROM dual;
--LTRIM 왼쪽 공백 자르기
SELECT LTRIM('    HELLO     ')
FROM dual;

--반올림 ROUND([숫자], [연산 후 소수점 자리]) 
SELECT 
	ROUND(1234.5678) AS ROUND,
	ROUND(1234.5678, 0) AS ROUND_0,
	ROUND(1234.5678, 1) AS ROUND_1,
	ROUND(1234.5678, 2) AS ROUND_2,
	ROUND(1234.5678, -1) AS ROUND_MINUS1,
	ROUND(1234.5678, -2) AS ROUND_MINUS2
FROM dual;

--123456을 1234로 나눈 값을 소수점 이하 2자리까지 반올림 하여 나타내면?
SELECT
	ROUND(123456 / 1234, 2)
FROM dual;

--버림 TRUNC([숫자], [연산 후 소수점 자리]) 
SELECT 
	TRUNC(1234.5678) AS TRUNC,
	TRUNC(1234.5678, 0) AS TRUNC_0,
	TRUNC(1234.5678, 1) AS TRUNC_1,
	TRUNC(1234.5678, 2) AS TRUNC_2,
	TRUNC(1234.5678, -1) AS TRUNC_MINUS1,
	TRUNC(1234.5678, -2) AS TRUNC_MINUS2
FROM dual;

--올림 CEIL(+부호 방향), FLOOR(-부호 방향)
SELECT 
	CEIL(3.14),
	FLOOR(3.14),
	CEIL(-3.14),
	FLOOR(-3.14)
FROM dual;

--MOD 나머지
SELECT 
	MOD(15, 6),
	MOD(10, 2),
	MOD(11, 2)
FROM dual;

--날짜데이터 함수
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
	TO_CHAR(sysdate, 'CC') AS FORMAT_CC, --세기
	TO_CHAR(sysdate, 'AD') AS FORMAT_AD, --AD
	TO_CHAR(sysdate, 'Q') AS FORMAT_Q, --분기
	TO_CHAR(sysdate, 'MI') AS FORMAT_MI, --분
	TO_CHAR(sysdate, 'MM') AS FORMAT_MM --월
FROM dual;
