--gitlab handbook 스타일 가이드에 맞춰 작성하였습니다.

--TABLE 생성
CREATE TABLE ex2_1 (
									  COLUMN1 CHAR(10),       -- 고정길이 문자, 최대 2000byte 디폴트 1byte
										COLUMN2 VARCHAR2(10),   -- 가변길이 문자, 최대 4000byte 디폴트 1byte
												  --NCHAR()         -- 고정길이 유니코드 문자(다국어 입력가능), 최대 2000byte 디폴트 1byte
										COLUMN3 NVARCHAR2(10),	-- 가변길이 유니코드 문자(다국어 입력가능), 최대 4000byte 디폴트 1byte
													--LONG            -- 최대 2GB 크기의 가변길이 문자형, 잘 사용하지 않음
										COLUMN4 NUMBER
							
										); 

INSERT INTO 
	ex2_1 (column1, column2)
	VALUES('abc', 'abc');
	
SELECT 
	column1, 
	LENGTH(column1) as len1, --고정길이 10으로 만든 column 결과값 10
	column2,
	LENGTH(column2) as len2 -- 가변길이 10으로 만든 column 결과값 3
FROM ex2_1;

CREATE TABLE ex2_2(
	COLUMN1 VARCHAR2(3), -- 디폴트 1byte 적용
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
												 '홍길동',
												 '홍길동', --1, 2 column은 3byte로 지정했기에 한글 입력이 안됨(한글은 한글자에 2byte)
												 '홍길동'
												 );

INSERT INTO ex2_2 (column3) VALUES('홍길동'); -- column3 은 char 3로 지정했기 때문에 입력가능

SELECT
	column3,
	LENGTH(column3) AS len,
	LENGTHB(column3) AS bytelen -- byte 길이 반환 6인걸 확인할 수 있다.
FROM ex2_2;
												
CREATE TABLE ex2_3(
	col_int INTEGER,
	col_dec DECIMAL,
	col_num NUMBER
	);

--테이블 칼럼 타입, 길이 확인하는 user_tab_cols 시스템뷰
SELECT
	column_id,
	column_name,
	data_type,
	data_length
FROM user_tab_cols
WHERE table_name = 'EX2_3'
ORDER BY column_id;