select * from t_member;

alter table t_member MODIFY phone varchar2(13);

update t_member set phone = '02-9999-9999' where role='M';

CREATE TABLE T_BOOK(
 REGNO NUMBER(5) PRIMARY KEY
,ISBN VARCHAR2(13) NOT NULL
,TITLE VARCHAR2(255) NOT NULL
,AUTHOR VARCHAR2(100)
,PUBLISHER VARCHAR2(100)
,PUBDATE VARCHAR2(12)
,DESCRIPTION VARCHAR2(4000)
,IMAGE VARCHAR2(255)
,REGDATE VARCHAR2(12) DEFAULT TO_CHAR(SYSDATE, 'YYYY-MM-DD')
,STATUS  VARCHAR2(20) DEFAULT '1'
);

CREATE SEQUENCE SEQ_T_BOOK_REGNO NOCACHE;

SELECT * FROM T_BOOK;
delete from t_book where regno=1;