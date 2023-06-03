CREATE TABLE T2_MEMBER (
         ID VARCHAR2(100) PRIMARY KEY
       , PASSWORD VARCHAR(100) NOT NULL
       , NAME VARCHAR2(100)
       , TYPE CHAR(1) DEFAULT 'U'
);

INSERT INTO T2_MEMBER VALUES (
       'admin',
       'admin',
       '관리자',
       'S'
);

INSERT INTO T2_MEMBER VALUES (
       'aaa',
       '1234',
       '홍길동',
       'U'
);

SELECT *
  FROM T2_MEMBER;
  
COMMIT;