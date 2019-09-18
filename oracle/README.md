
< ORACLE SQL 실습자료 - 실습용 sample DB 설치방법 >

sampleDB.zip 파일의 압축을 풀고

SQL Plus를 실행하고 압축푼 경로를 입력하여 실행한다

예) C:\sampleDB\ 경로에 압축을 풀어 놓은 경우

SQL> @C:\sampleDB\haksa.sql

SQL> @C:\sampleDB\haksa_data.sql

SQL> @C:\sampleDB\ec.sql

SQL> @C:\sampleDB\ec_data.sql

--테이블이 생성 되었는지 확인해본다

SELECT * FROM USER_CATALOG;

SQL> DESC Student;

SQL> DESC EC_Product;

SQL> SELECT * FROM Student;

SQL> SELECT * FROM EC_Product;
