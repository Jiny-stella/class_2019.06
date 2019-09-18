- SQL실습과제_INSERT_CREATE문 답안

-- INSERT문

-- 1번
INSERT INTO EC_Product
(Product_Code, Product_Name, standard,
 Unit_Price, Left_Qty, Company, ImageName, Info)
VALUES
('FL01','꽃다발','붉은 장미', 45000,20,'글로리아',
'ROSE_01.JPG',NULL);

INSERT INTO EC_Product
(Product_Code, Product_Name, standard, 
Unit_Price, Left_Qty, Company, ImageName, Info)
VALUES
('FL02','백합꽃병','백합꽃', 80000,20,'글로리아',
'box_02.JPG',NULL);

INSERT INTO EC_Product
(Product_Code, Product_Name, standard, 
Unit_Price, Left_Qty, Company, ImageName, Info)
VALUES
('FL03','꽃상자','장미100송이', 130000,20,'글로리아',
'ROSE_03.JPG',NULL);

SELECT Product_Code,Product_Name, Standard, 
Unit_Price, Left_Qty, Company,Imagename
FROM   EC_Product
WHERE  Product_Code Like 'FL%';


-- 2번
SELECT *
FROM   EC_Basket;

INSERT INTO EC_ORDER
(ORDER_NO, ORDER_ID, PRODUCT_CODE, ORDER_QTY)
   SELECT ORDER_NO, ORDER_ID, PRODUCT_CODE, ORDER_QTY
   FROM   EC_BASKET;

-- 3번
UPDATE EC_Order
SET    Gubun = '미결재'
WHERE  CDate IS NULL;

SELECT Order_ID, Product_Code, Order_QTY, CMoney, Gubun
FROM   EC_ORDER
WHERE  Gubun = '미결재';

-- 4번
DELETE FROM EC_Basket;

DESC EC_Order;

-- 5번
UPDATE EC_Order
SET    Csel  = '현금입금',
       Cdate = '02/03/15',
       Gubun = '결재'
WHERE  Order_ID = 'jupark';

SELECT Order_ID,Csel,Cmoney,Cdate,Gubun
FROM   EC_Order
WHERE  Order_ID = 'jupark';

COMMIT;


-- CREATE문

-- 1번
CREATE TABLE Board (
B_Id        NUMBER(5)       PRIMARY KEY,
B_Name      VARCHAR2(20)    NOT NULL,
B_Pwd       VARCHAR2(20)    NOT NULL,  
B_Email     VARCHAR2(20)    NOT NULL,  
B_Title     VARCHAR2(80)    NOT NULL,  
B_Content   VARCHAR2(2000)  NOT NULL,  
B_Date      DATE            DEFAULT     SYSDATE,
B_Hit       number(5)       DEFAULT     0,
B_Ip        VARCHAR2(15) );

DESC Board;


-- 2번
ALTER   TABLE    Board
ADD     (B_Ref   NUMBER(5)   DEFAULT    0,
         B_Step  NUMBER(5)   DEFAULT    0,
         B_Order NUMBER(5)   DEFAULT    0);

DESC Board;


-- 3번
ALTER   TABLE    Board
MODIFY  (B_Title   VARCHAR2(100));

DESC Board;


-- 4번
ALTER   TABLE    Board
MODIFY  (B_Pwd   VARCHAR2(20)  NULL);

DESC Board;


-- 5번
ALTER   TABLE    Board
DROP    COLUMN   B_Ip;

DESC Board;


-- 6번
DESC Board;


-- 7번

ALTER   TABLE   EC_MEMBER
ADD ( CONSTRAINT  Member_CK  CHECK (UserID BETWEEN 'a' AND 'z'));

--(1)
INSERT INTO EC_Member (UserID, Passwd, Name, Regist_No, Telephone)
VALUES ( 'srlee', '1234', '이소라', '821001-2******', '010-123-1234');

--(2)
INSERT INTO EC_Member ( UserID, Passwd, Name , Regist_No, Telephone )
VALUES ( '20park', '1234', '박연수', '810604-1******', '010-234-2345');

DESC EC_Member;
SELECT * FROM EC_Member;

-- 8번
ALTER   TABLE    Board
RENAME  COLUMN  B_Step  TO  B_Level;

DESC Board;

-- 9번
ALTER   TABLE    EC_Order   DROP    PRIMARY KEY;

DESC EC_Order;

-- 10번
ALTER   TABLE    Board
    MODIFY  (B_Email  VARCHAR2(20)  CONSTRAINT  Board_uk   UNIQUE);

DESC Board;


-- 11번
RENAME Board TO FREE_Board;

DESC FREE_Board;

-- 12번
DROP TABLE EC_BASKET;


