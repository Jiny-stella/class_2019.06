-- IMPORT_EXCEL.SQL
-- excel_exam.xlsx 파일을 import 하여 EXAM 테이블 생성하기

-- [1] Table 만들기
CREATE TABLE EXAM (
    ID      NUMBER(2)   PRIMARY KEY,
    CLASS   NUMBER(2)   NOT NULL,
    MATH    NUMBER(3),
    ENGLISH NUMBER(3),
    SCIENCE NUMBER(3)
);

DESC EXAM;

-- 테이블을 잘못 생성했을경우 DROP명령어로 삭제하고 다시 CREATE실행
-- DROP TABLE EXAM;

-- [2] 엑셀 데이터를 IMPORT 하기(Toad사용법)

-- Toad에서  Database -->Import --> Import Table Data 실행

-- Object Name : EXAM  선택후  -> NEXT

-- Excel file을 체크 선택하고 excel_exam.xlsx 파일을 선택해준다 -> NEXT

-- First Row:2 (헤더는 삭제) , Last Row : 입력안하거나 원하는 값 입력 후 -> NEXT

-- 이후 계속 NEXT나 OK를 누르고 EXECUTE를 눌러서 완료한다

-- IMPORT된 데이터를 확인해본다
SELECT *
FROM EXAM;

-- [3] 데이터 분석하기

--(1) 프로젝션: 열 추출하기
SELECT ID,CLASS,MATH
FROM EXAM;

--(2) 셀렉션 : 행 추출하기
SELECT ID,CLASS,MATH
FROM EXAM
WHERE MATH >= 60;

SELECT *
FROM EXAM
WHERE CLASS = 1;

SELECT *
FROM EXAM
WHERE CLASS IN (1,3,5);

SELECT *
FROM EXAM
WHERE CLASS = 5
    AND MATH > 70;

--(3) 총점과 평균의 컬럼을 추가, 평균을 오름차순으로 출력하기
SELECT ID, CLASS,MATH,ENGLISH,SCIENCE,
   MATH+ENGLISH+SCIENCE AS "총점",
   ROUND((MATH+ENGLISH+SCIENCE)/3) AS "평균"
  FROM EXAM  
  ORDER BY ROUND((MATH+ENGLISH+SCIENCE)/3);
  
--(4) 컬럼들의 평균 구하기
SELECT  AVG(MATH)    AS "수학평균",
        AVG(ENGLISH) AS "영어평균",
        AVG(SCIENCE) AS "과학평균"
    FROM EXAM;

--(5) 반별 평균 구하기 
SELECT CLASS, AVG(MATH) AS "수학평균"
 FROM EXAM
GROUP BY CLASS; 

SELECT CLASS, AVG(MATH) AS "수학평균"
 FROM EXAM
GROUP BY CLASS
    HAVING AVG(MATH) > 60;

--(6) 반별 학생수(빈도) 구하기
SELECT CLASS, COUNT(*) AS CNT
FROM EXAM
GROUP BY CLASS
ORDER BY CLASS;

--(7) NULL 결측치 처리 
-- 테스트를 위한 결측 데이터를 삽입
INSERT INTO EXAM (ID,CLASS,MATH,ENGLISH,SCIENCE)
        VALUES ( 21,6, NULL,NULL,95);
        
INSERT INTO EXAM (ID,CLASS,MATH,ENGLISH,SCIENCE)
        VALUES ( 22,6, 80,NULL,NULL);

INSERT INTO EXAM (ID,CLASS,MATH,ENGLISH,SCIENCE)
        VALUES ( 23,6, NULL,75,NULL);

SELECT *
FROM EXAM; 

-- 행 삭제
DELETE FROM EXAM
WHERE ID IN (21,22,23);

-- 결측치를 0으로 설정하여 총점 구하기
SELECT ID, CLASS,MATH,ENGLISH,SCIENCE,
   MATH+ENGLISH+SCIENCE AS "NULL_총점",
   NVL(MATH,0)+NVL(ENGLISH,0)+NVL(SCIENCE,0) AS "NVL_총점"
  FROM EXAM;  
