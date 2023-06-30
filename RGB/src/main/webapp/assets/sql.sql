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
              '���������̶��',
              '����������������������������������������������ǿ���������������',
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

select * from BANK_USER;
update BANK_USER set role_cd = 'M1' where user_id='admin01';

SELECT * FROM PRODUCT WHERE STATUS_CD = 1;

CREATE TABLE BANK_USER_ROLE (
	"ROLE_CD"	CHAR(2)		NOT NULL,
	"ROLE_NM"	varchar2(255)		NULL
);

INSERT INTO status VALUES('9', 'Ż��');
INSERT INTO product(product_cd, product_name, interest_rate) VALUES('C', '������ ���� ����', 4.5);

rollback;

SELECT * FROM account;
SELECT * FROM product;

UPDATE product
SET interest_rate = 1.40;



COMMIT;

ALTER TABLE BANK_USER_ROLE ADD CONSTRAINT "PK_ROLE" PRIMARY KEY (
	"ROLE_CD"
);

ALTER TABLE BANK_USER ADD CONSTRAINT FK_BANK_USER_TO_BANK_USER_ROLE FOREIGN KEY (
	ROLE_CD
) REFERENCES BANK_USER_ROLE(ROLE_CD);

select * from account;

SELECT * FROM BANK_USER WHERE USER_ID = 'j.hyun123@kakao.comK' AND SIGNUP_TYPE = 'K';

select * from product;


commit;


CREATE TABLE ACCOUNT (
	"account_number"	varchar2(100)		PRIMARY KEY,
	"user_id"	       varchar2(20)		NULL,
	"bank_cd"	       varchar2(1)		NULL,
	"product_cd"	       varchar2(1)		NULL,
	"account_password"	number(4)		NULL,
	"reg_date"	       date		       NULL,
	"balance"	       number(30)		NULL
);

CREATE TABLE status (
	"status_cd"	       varchar2(1)		PRIMARY KEY,
	"status_name"   	varchar2(20)		NULL
);

CREATE TABLE PRODUCT (
	"product_cd"  	varchar2(1)		PRIMARY KEY,
	"product_name"	varchar2(1)		NULL,
	"interest_rate"	VARCHAR(255)		NULL,
	"reg_date"	       date	              NULL
);

ALTER TABLE ACCOUNT
MODIFY ("status_cd" DEFAULT '1');

CREATE DATABASE LINK JI
CONNECT TO hr IDENTIFIED BY hr
USING '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=172.31.9.170)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=XE)))';

CREATE DATABASE LINK YJ
CONNECT TO hr IDENTIFIED BY hr
USING '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=172.31.9.179)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=XE)))';

select * from TRANSACTION;

delete account where account_no='999518928527';

commit;

CREATE SEQUENCE TRANS_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE TABLE TRANSACTION (
       TRANS_ID             NUMBER               DEFAULT TRANS_SEQ.NEXTVAL PRIMARY KEY,
       bank_cd	       varchar2(3)          NOT NULL,
       id	              varchar2(20)		NOT NULL,
       MEMBER_NAME          varchar2(50)         NOT NULL,
       TRANS_CD             varchar2(20)         NOT NULL,
       TRANS_AMOUNT         NUMBER               NOT NULL,
	TRANS_DATE           DATE                 DEFAULT TRUNC(SYSDATE),
       TRANS_TIME           VARCHAR2(10)         DEFAULT TO_CHAR(SYSDATE, 'HH24:MI:SS'),
       ACCOUNT_NO	       varchar2(100)		NOT NULL,
	balance	       number(30)		NULL
);

select * from TRANSACTION where TRANS_ACCOUNT='999502420203' order by trans_no desc;

INSERT INTO TRANSACTION(BANK_CD, TRANS_NAME, TRANS_TYPE, TRANS_AMOUNT, TRANS_ACCOUNT, TRANS_BALANCE ) 
                 VALUES('999'  , 'īī��'    , 'D'       ,  50000      , '999364791767'  , (select account_balance from account where account_no='999364791767'));
INSERT INTO TRANSACTION(BANK_CD, TRANS_NAME, TRANS_TYPE, TRANS_AMOUNT, TRANS_ACCOUNT, TRANS_BALANCE ) 
                 VALUES('999'  , 'īī��'    , 'W'       ,  50000      , '999502420203'  , (select account_balance from account where account_no='999502420203'));
                 
select * from account;
update account set account_balance= (account_balance-50000) where account_no='999502420203';
update account set account_balance= (account_balance+50000) where account_no='999364791767';
                 
update TRANSACTION set TRANS_TYPE = 'W' where TRANS_ACCOUNT='999249566661';                 

commit;
select* FROM bank_user;

SELECT B_NO, TITLE, CONTENT, REG_DATE, PARENT_ID, USER_ID, NAME, HITS
FROM BANK_BOARD;

--------------------------
--���ν���
--------------------------
 create or replace NONEDITIONABLE PROCEDURE P_Transaction(

       --//��ݰ���     
       W_Trans_Account IN VARCHAR2,
       --//������� �ڵ�
       W_Bank_cd IN VARCHAR2,
       --//�����»�� �̸�
       D_Trans_name IN VARCHAR2,
       --//�Աݰ���
       D_Trans_Account IN VARCHAR2,
       --//�Ա����� �ڵ�
       D_Bank_cd IN CHAR,
       --//�޴»�� �̸�
       W_Trans_name IN VARCHAR2,
       --//�ŷ� �ݾ�
       W_Trans_amount IN NUMBER,
       --�����
       v_result OUT NUMBER
) AS
       --��ݰ��� �ܾ�
       W_balance NUMBER;
       --�Աݰ��� �ܾ�
       D_balance NUMBER;
BEGIN

       CASE W_Bank_cd
       --��� ������ RG�϶�
       WHEN '999' THEN
           -- ��� ������ �ܾ� Ȯ��
           SELECT ACCOUNT_BALANCE INTO W_balance
           FROM ACCOUNT
           WHERE ACCOUNT_NO = W_Trans_Account;

           -- ��ü �ݾ��� ��� ���� �ܾ׺��� ū�� Ȯ��
           IF W_Trans_amount  > W_balance  THEN
               RAISE_APPLICATION_ERROR(-20001, '�ܾ��� �����մϴ�.');
           END IF;

           -- ��� ���� �ܾ� ������Ʈ
           UPDATE ACCOUNT
           SET ACCOUNT_BALANCE = ACCOUNT_BALANCE - W_Trans_amount
           WHERE ACCOUNT_NO = W_Trans_Account;

           -- �α� ���̺� ��� ��� �߰�
           INSERT INTO TRANSACTION (BANK_CD, TRANS_NAME, TRANS_TYPE, TRANS_AMOUNT, TRANS_ACCOUNT, TRANS_BALANCE)
           VALUES (W_Bank_cd, W_Trans_name, 'W', W_Trans_amount, W_Trans_Account, (SELECT ACCOUNT_BALANCE FROM ACCOUNT WHERE ACCOUNT_NO = W_Trans_Account));    

       --��� ������ NINI�϶� 
       WHEN '333' THEN    
           -- ��� ������ �ܾ� Ȯ��
           SELECT ACCOUNT_BALANCE INTO W_balance
           FROM ACCOUNT@JI
           WHERE ACCOUNT_NO = W_Trans_Account;

           -- ��ü �ݾ��� ��� ���� �ܾ׺��� ū�� Ȯ��
           IF W_Trans_amount > W_balance THEN
               RAISE_APPLICATION_ERROR(-20001, '�ܾ��� �����մϴ�.');
           END IF;

           -- ��� ���� �ܾ� ������Ʈ
           UPDATE ACCOUNT@JI
           SET ACCOUNT_BALANCE = ACCOUNT_BALANCE - W_Trans_amount
           WHERE ACCOUNT_NO = W_Trans_Account;

            -- �α� ���̺� ��� ��� �߰�
           INSERT INTO TRANSACTION_HISTORY@JI (TRANSACTION_ID, ACCOUNT_NUMBER, TRANSACTION_DATE, TRANSACTION_TYPE, AMOUNT ,BANK_CODE, SENDER_NAME, RECIPIENT_NAME)
           VALUES (W_Trans_Account, D_Trans_Account, SYSDATE, '���', W_Trans_amount, W_Bank_cd, D_Trans_name, W_Trans_name);

       --��� ������ YJ ��ũ�϶� 
       WHEN '777' THEN    
           -- ��� ������ �ܾ� Ȯ��
           SELECT ACCOUNT_BALANCE INTO W_balance
           FROM ACCOUNT@YJ
           WHERE ACCOUNT_NO = W_Trans_Account;

           -- ��ü �ݾ��� ��� ���� �ܾ׺��� ū�� Ȯ��
           IF W_Trans_amount  > W_balance  THEN
               RAISE_APPLICATION_ERROR(-20001, '�ܾ��� �����մϴ�.');
           END IF;

           -- ��� ���� �ܾ� ������Ʈ
           UPDATE ACCOUNT@YJ
           SET ACCOUNT_BALANCE = ACCOUNT_BALANCE - W_Trans_amount
           WHERE ACCOUNT_NO = W_Trans_Account;

            -- �α� ���̺� ��� ��� �߰�
           INSERT INTO TRANSACTION@YJ (ACCOUNT_CODE, TRANS_NAME, TRANS_TYPE, TRANS_AMOUNT, TRANS_ACCOUNT, TRANS_BALANCE)
           VALUES (W_Bank_cd, W_Trans_name, 'withdraw', W_Trans_amount, W_Trans_Account, (SELECT ACCOUNT_BALANCE FROM ACCOUNT@YJ WHERE ACCOUNT_NO = W_Trans_Account));

       END CASE;
           

       CASE W_Bank_cd
       --�Ա� ������ RG�϶� 
       WHEN '999' THEN
           -- �Ա� ������ �ܾ� Ȯ��
           SELECT ACCOUNT_BALANCE INTO D_balance
           FROM ACCOUNT
           WHERE ACCOUNT_NO = D_Trans_Account;

           -- �Ա� ���� �ܾ� ������Ʈ
           UPDATE ACCOUNT
           SET ACCOUNT_BALANCE = ACCOUNT_BALANCE + W_Trans_amount
           WHERE ACCOUNT_NO = D_Trans_Account;

           -- �α� ���̺� �Ա� ��� �߰�
           INSERT INTO TRANSACTION (BANK_CD, TRANS_NAME, TRANS_TYPE, TRANS_AMOUNT, TRANS_ACCOUNT, TRANS_BALANCE)
           VALUES (D_Bank_cd, D_Trans_name, 'D', W_Trans_amount, D_Trans_Account ,(SELECT ACCOUNT_BALANCE FROM ACCOUNT WHERE ACCOUNT_NO = D_Trans_Account));


       --�Ա� ������ NINI�϶� 
       WHEN '333' THEN    
           -- �Ա� ������ �ܾ� Ȯ��
           SELECT ACCOUNT_BALANCE INTO D_balance
           FROM ACCOUNT@JI
           WHERE ACCOUNT_NO = D_Trans_Account;

           -- �Ա� ���� �ܾ� ������Ʈ
           UPDATE ACCOUNT@JI
           SET ACCOUNT_BALANCE = ACCOUNT_BALANCE + W_Trans_amount
           WHERE ACCOUNT_NO = D_Trans_Account;

           -- �α� ���̺� �Ա� ��� �߰�
           INSERT INTO TRANSACTION_HISTORY@JI (TRANSACTION_ID, ACCOUNT_NUMBER, TRANSACTION_DATE, TRANSACTION_TYPE, AMOUNT ,BANK_CODE, SENDER_NAME, RECIPIENT_NAME)
           VALUES (D_Trans_Account, W_Trans_Account, SYSDATE, '�Ա�', W_Trans_amount, D_Bank_cd, W_Trans_name, D_Trans_name);

       --�Ա� ������ YJ�϶� 
       WHEN '777' THEN           
           -- �Ա� ������ �ܾ� Ȯ��
           SELECT ACCOUNT_BALANCE INTO D_balance
           FROM ACCOUNT@YJ
           WHERE ACCOUNT_NO = D_Trans_Account;

           -- �Ա� ���� �ܾ� ������Ʈ
           UPDATE ACCOUNT@YJ
           SET ACCOUNT_BALANCE = ACCOUNT_BALANCE + W_Trans_amount
           WHERE ACCOUNT_NO = D_Trans_Account;

           -- �α� ���̺� �Ա� ��� �߰�
           INSERT INTO TRANSACTION@YJ (ACCOUNT_CODE, TRANS_NAME, TRANS_TYPE, TRANS_AMOUNT, TRANS_ACCOUNT, TRANS_BALANCE)
           VALUES (D_Bank_cd, D_Trans_name, 'deposit', W_Trans_amount, D_Trans_Account ,(SELECT ACCOUNT_BALANCE FROM ACCOUNT@YJ WHERE ACCOUNT_NO = D_Trans_Account)); 
       END CASE;


    v_result := 1;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        v_result := 0;
        RAISE;
END;
/




