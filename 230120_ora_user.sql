CREATE UNIQUE INDEX ex2_10_ix01
ON ex2_10 (col11);

SELECT
	index_name,
	index_type,
	table_name,
	uniqueness
FROM user_indexes
WHERE table_name = 'EX2_10';

SELECT
	constraint_name,
	constraint_type,
	table_name,
	index_name
FROM user_constraints
WHERE table_name = 'JOB_HISTORY';

SELECT
	index_name,
	index_type,
	table_name,
	uniqueness
FROM user_indexes
WHERE table_name = 'JOB_HISTORY';

CREATE INDEX ex2_10_ix02
ON ex2_10 (col11, col2);

SELECT
	index_name,
	index_type,
	table_name,
	uniqueness
FROM user_indexes
WHERE table_name = 'EX2_10';

/*
Synonym Public �����ϸ� private���� �������
CREATE OR REPLACE [PUBLIC] SYNONYM [�ó�Ը�]
FOR [��ü��];
*/

CREATE OR REPLACE SYNONYM syn_channel
FOR channels;

CREATE OR REPLACE SYNONYM syn_channel2
FOR channels;

SELECT COUNT(*)
FROM syn_channel;

ALTER USER HR IDENTIFIED BY HR ACCOUNT UNLOCK;

SELECT COUNT(*)
FROM ora_user.syn_channel;

SELECT * FROM dba_sys_privs
WHERE grantee = 'SCOTT';

GRANT SELECT ON ora_user.syn_channel TO SCOTT;

SELECT *
FROM ora_user.syn_channel;

REVOKE SELECT ON ora_user.syn_channel FROM  scott;
commit;

/*������ ����
CREATE SEQUENCE [������ ��]
INCREMENT BY [��������]
START WITH [���ۼ���]
NOMINVALUE | MINVALUE [�ּڰ�]
NOMAXVALUE | MAXVALUE [�ִ�]
NOCYCLE | CYCLE
NOCACHE | CACHE
*/

CREATE TABLE ex3_3 (
	employee_id NUMBER,
	bonus_amt NUMBER DEFAULT 0);
	
INSERT INTO ex3_3 (employee_id)
	SELECT e.employee_id
		FROM employees e, sales s
	WHERE e.employee_id = s.employee_id
	AND s.SALES_MONTH BETWEEN '200010' AND '200012'
	GROUP BY e.employee_id;
	
