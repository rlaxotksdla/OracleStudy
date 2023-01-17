--gitlab handbook ��Ÿ�� ���̵忡 ���� �ۼ��Ͽ����ϴ�.

--TABLE ����
CREATE TABLE ex2_1 (
									  COLUMN1 CHAR(10),       -- �������� ����, �ִ� 2000byte ����Ʈ 1byte
										COLUMN2 VARCHAR2(10),   -- �������� ����, �ִ� 4000byte ����Ʈ 1byte
												  --NCHAR()         -- �������� �����ڵ� ����(�ٱ��� �Է°���), �ִ� 2000byte ����Ʈ 1byte
										COLUMN3 NVARCHAR2(10),	-- �������� �����ڵ� ����(�ٱ��� �Է°���), �ִ� 4000byte ����Ʈ 1byte
													--LONG            -- �ִ� 2GB ũ���� �������� ������, �� ������� ����
										COLUMN4 NUMBER
							
										); 

INSERT INTO 
	ex2_1 (column1, column2)
	VALUES('abc', 'abc');
	
SELECT 
	column1, 
	LENGTH(column1) as len1, --�������� 10���� ���� column ����� 10
	column2,
	LENGTH(column2) as len2 -- �������� 10���� ���� column ����� 3
FROM ex2_1;

CREATE TABLE ex2_2(
	COLUMN1 VARCHAR2(3), -- ����Ʈ 1byte ����
	COLUMN2 VARCHAR2(3 byte),
	COLUMN3 VARCHAR2(3 char)
	);
	
INSERT INTO ex2_2 VALUES(
											   'abc',
												 'abc',
												 'abc'
												 );
										
SELECT 
	column1, 
	LENGTH(column1) AS len1,
	column2,
	LENGTH(column2) AS len2,
	column3,
	LENGTH(column3) AS len3
FROM ex2_2;

INSERT INTO ex2_2 VALUES(
												 'ȫ�浿',
												 'ȫ�浿', --1, 2 column�� 3byte�� �����߱⿡ �ѱ� �Է��� �ȵ�(�ѱ��� �ѱ��ڿ� 2byte)
												 'ȫ�浿'
												 );

INSERT INTO ex2_2 (column3) VALUES('ȫ�浿'); -- column3 �� char 3�� �����߱� ������ �Է°���

SELECT
	column3,
	LENGTH(column3) AS len,
	LENGTHB(column3) AS bytelen -- byte ���� ��ȯ 6�ΰ� Ȯ���� �� �ִ�.
FROM ex2_2;
												
CREATE TABLE ex2_3(
	col_int INTEGER,
	col_dec DECIMAL,
	col_num NUMBER
	);

--���̺� Į�� Ÿ��, ���� Ȯ���ϴ� user_tab_cols �ý��ۺ�
SELECT
	column_id,
	column_name,
	data_type,
	data_length
FROM user_tab_cols
WHERE table_name = 'EX2_3'
ORDER BY column_id;