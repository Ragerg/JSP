CREATE SEQUENCE SEQ_BANK_BOARD_NO INCREMENT BY 1 START WITH 1 NOCYCLE NOCACHE;

CREATE TABLE BANK_BOARD (
       B_NO     NUMBER DEFAULT SEQ_BANK_BOARD_NO.NEXTVAL PRIMARY KEY,
       TITLE    VARCHAR2(255) NOT NULL,
       USER_ID  VARCHAR2(255),
       NAME     VARCHAR2(255),
       CONTENT  CLOB NOT NULL,
       HITS     INT DEFAULT 0,
       REG_DATE DATE DEFAULT SYSDATE,
       PARENT_ID NUMBER
);

commit;


drop table user;


drop SEQUENCE SEQ_BANK_BOARD_NO;


select * from bank_board;
rollback;

INSERT INTO BANK_BOARD (
              TITLE,
              CONTENT,
              parent_id
       ) VALUES (
              '대댓글제목이라네',
              '내요오오오오오오오오오오오오오오오오오오오오오ㅗ오오오오오오오옹',
              14
       )
       ;
       commit;


select * from bank_board order by group_id;

SELECT *
FROM (
  SELECT m.*, rownum AS rn
  FROM (
    SELECT B_NO, TITLE, USER_ID, NAME, HITS, GROUP_ID,
                  TO_CHAR(REG_DATE, 'YYYY-MM-DD') AS REG_DATE, THREAD 
      FROM BANK_BOARD ORDER BY GROUP_ID DESC, THREAD ASC
  ) m
)
WHERE rn BETWEEN 11 AND 20;

select nvl(max(thread),'0') as maxThread 
from bank_board
where group_id = 2 and thread like thread || '%';


SELECT *
  FROM (
       SELECT M.*,
              ROWNUM AS RN
         FROM (
              SELECT LEVEL, B_NO, TITLE, CONTENT, REG_DATE, PARENT_ID, USER_ID, NAME, HITS
                FROM BANK_BOARD
              START WITH PARENT_ID = 0 
              CONNECT BY PRIOR B_NO = PARENT_ID
              ORDER SIBLINGS BY B_NO DESC
       ) M
)
 WHERE RN BETWEEN 10 AND 20;

SELECT * FROM BANK_BOARD;

update bank_board set parent_id = 0 where parent_id is null;

commit;

------------------user
CREATE TABLE BANK_USER (
	"USER_ID"	varchar2(255)		primary key,
	"ROLE_CD"	CHAR(2)		default 'U1',
	"USER_PWD"	varchar2(255)		not null,
	"USER_NAME"	varchar2(255)		,
	"USER_BIRTHDAY"	varchar2(10)		,
	"PHONE_NO"	varchar2(13)		,
	"SIGNUP_TYPE"	varchar2(5)		default 'W',
	"REG_DATE"	DATE	DEFAULT SYSDATE,
	"POSTCODE"	CHAR(5),
	"ADDRESS"	varchar2(2048),
	"DETAIL_ADDRESS"	varchar2(255)
);
drop table BANK_USER;

CREATE TABLE BANK_USER_ROLE (
	"ROLE_CO"	CHAR(2)		NOT NULL,
	"ROLE_NM"	varchar2(255)		NULL
);

INSERT INTO BANK_USER_ROLE VALUES('M1', '관리자');

SELECT * FROM BANK_USER_ROLE;
COMMIT;

ALTER TABLE BANK_USER_ROLE ADD CONSTRAINT "PK_ROLE" PRIMARY KEY (
	"ROLE_CO"
);

ALTER TABLE BANK_USER ADD CONSTRAINT FK_BANK_USER_TO_BANK_USER_ROLE FOREIGN KEY (
	ROLE_CD
) REFERENCES BANK_USER_ROLE(ROLE_CD);

select * from bank_user;

SELECT * FROM BANK_USER WHERE USER_ID = 'j.hyun123@kakao.comK' AND SIGNUP_TYPE = 'K';

delete from bank_user where user_id = 'j.hyun123@kakao.comK';
commit;